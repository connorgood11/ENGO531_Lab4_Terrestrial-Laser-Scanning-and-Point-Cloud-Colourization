addpath(genpath([pwd,'\readInputs']));
addpath(genpath([pwd,'\functions']));

close all;
clear;
clc;

% read files
[IOPs, CON, EOPs, PHO, TIE] = readInputs();
TIE = [];
PHO = getTrimmedObservations(PHO, CON);
% checks
%each tie point observed in at least two images  
%each GCP observed in at least two images
%each image has at least three points observed

%Run weighted control points bundle adjustment on inputs
%COMPUTELSA
    
    %Storing the initial TIE and CON values
    initial_TIE = TIE;
    initial_CON = CON;
    initial_EOPs = EOPs;
    
    %Converting the angles in EOPs to radians
    EOPs(:, 6:8) = EOPs(:, 6:8)*pi/180;
    
    %Convergence criteria
    tolerance = 1000; % decimal places to check for when checking for convergence
    maxDelta = 1; % assigning this to a nonzero number to not trigger convergence check
    iterations = 0; % starting at 0th iteration
    maxIterations = 10;
    
    %Compute dimensions n, u
    [n, no, u, ue, uo] = computeDimensions(PHO, TIE, CON, EOPs);
    
    while ~isConverged(maxDelta, tolerance) && iterations < maxIterations
        %Compute Design Parameters and misclosure
        [Ae, Ao, Ai, w] = get_Ae_Ao_w(IOPs, CON, EOPs, PHO, TIE); %#ok<ASGLU>
        
        %Compute the misclosure of the observed control points
        wo = compute_wo(TIE, CON, initial_TIE, initial_CON);

        %Compute weight matrices P (EOPs) and Po (points: observed control) 
        P = getP(PHO, 1);
        Po = getPo(PHO, TIE, CON);

        %Compute Normal Equations Matrix and Vector
        N = getN(Ae, Ao, P, Po);
        u_vec = get_u(Ae, Ao, P, Po, w, wo);

        %Compute Delta and its components delta_e(EOPs) and delta_o(Points)
        %where Ae and Ao are n x me and n by mo
        [delta, delta_e, delta_o] = getDeltas(N, u_vec, ue, uo);
        
        %Compute the residuals of the observations v and the points vo
        [v, vo, vx, vy] = getResiduals(Ae, Ao, ue, uo, delta, w, wo);

        %Compute corrected EOPs
        EOPs = correctEOPs(delta_e, EOPs);

        %compute corrected XYZ of points
        [TIE, CON] = correctTieCon(delta_o, TIE, CON);
        
        %Increment the number of iterations performed in the LSA
        iterations = iterations + 1;
        
        %Reassign maxDelta to check for convergence before next iteration
        maxDelta = max(delta);
    end

    %Compute the estimated variance factor
    estimatedVarianceFactor = estimateVarianceFactor(v, P, vo, Po, n, u, no);
    
    %Converting the angles in EOPs to degrees
    EOPs(:, 6:8) = EOPs(:, 6:8)/pi*180;
    
    %displaying the outputs
    points = getSortedPointNumbers(TIE, CON);
    number = '%f';
    matrix = '%f';
    file_ID = fopen('Lab1_output.txt', 'w');
    camerasUsed = unique(EOPs(:, 2));
    numberOfTiePoints = size(TIE, 1);
    numberOfControlPoints = size(CON, 1);
    numberOfPoints = numberOfTiePoints + numberOfControlPoints;
    totalNumberOfObservations = n + no;
    degreesOfFreedom = totalNumberOfObservations - u;
    quadraticFormOfResiduals = v.'*P*v + vo.'*Po*vo;
    
    standardizedResiduals = v/estimatedVarianceFactor;
    
    C_xhat = N^(-1);
    sd_EOPs = sqrt(diag(C_xhat(1:ue,1:ue)));
    sd_Points = sqrt(diag(C_xhat(ue+1:ue+uo,ue+1:ue+uo)));
    
    A = [Ae Ao];
    
    C_l = estimatedVarianceFactor*P^-1;
    
    C_vhat = C_l - A*(A.'*P*A)^-1*A.';
    
    w_i = v./sqrt(diag(abs(C_vhat)));
    
    R = C_vhat * C_l^-1; %correlated redundancy numbers
    r_i = diag(C_vhat).*diag(C_l); %uncorrelated redundancy numbers
    %disp("" + );
    disp("The number of Cameras used: " + size(camerasUsed, 1));
    disp("Numbers of the Cameras used: " + camerasUsed);
    disp("The number of points: " + numberOfPoints);
    disp("The number of control points: " + numberOfControlPoints);
    disp("The number of tie points: " + numberOfTiePoints);
    disp("Number of observations: " + totalNumberOfObservations);
    disp("Number of unknowns: " + u);
    disp("Degrees of freedom: " + degreesOfFreedom);
    disp("Initial External orientation parameters: ");
    fprintf("\n\t\tImage\t\tCamera\t\t X\t\t\t Y\t\t\t   Z\t\t   w\t\t   p\t\t   k\n");
    disp(initial_EOPs)
    fprintf("\nInitial Control Points: ");
    fprintf("\n\t\t\t\t\tPoint\t\t\t\t\t\tx\t\t\t\t\t\t\ty\t\t\t\t\t\tz\n");
    disp(initial_CON);
    fprintf("\nInitial Tie Points: ");
    fprintf("\n\t\tPoint\t\t  x\t\t\t   y\t\t   z\n");
    disp(initial_TIE);
    
    
    fprintf("\nRESULTS----------------------------");
    fprintf("\nIterations ran: ");
    disp(iterations);
    fprintf("\n\nResulting EOPs: \n");
    disp(EOPs);
    fprintf("\n\nResulting Control Points: \n");
    disp(CON);
    fprintf("\n\nResulting Tie Points: \n");
    disp(TIE);
    fprintf("\n\nQuadratic form of the Residuals: \n");
    disp(quadraticFormOfResiduals);
    fprintf("\n\nEstimated Variance Factor: ");
    disp(estimatedVarianceFactor);
    fprintf("\n\nResiduals of the observations:\n");
    fprintf("\t\t\t\t\t\tPoint\t\t\t\t\tImage\t\t\t\tv_x\t\t\t\t\tv_y\n");
    disp([PHO(:,1:2),vx,vy]);
    disp("RMS: " + sqrt(sum(v.^2)/size(v,1)));
    fprintf("\n\nResiduals of the points:\n");
    fprintf("\t\t\t\t\t\tPoint\t\t\t\tX\t\t\t\t\t\t\tY\t\t\t\t\t\t\tZ\n");
    disp(getFormattedPointResiduals(vo, TIE, CON));
    disp("RMS: " + sqrt(sum(vo.^2)/size(vo,1)));
    fprintf("\n\nStandard Deviation of the EOPs:\n");
    fprintf("Image X Y Z w p k\n");
    disp([unique(EOPs(:,1)),format_sd_EOPs(sd_EOPs)]);
    fprintf("\n\nStandard Deviation of the Points:\n");
    fprintf("\t\t\t\t\t\tPoint \t\t\t\tx \t\t\t\t\t\ty \t\t\t\t\t\tz\n");
    disp([points,sd_Points(1:3:size(sd_Points,1)-2),sd_Points(2:3:size(sd_Points,1)-1),sd_Points(3:3:size(sd_Points,1))]);
    
    
    figure;
    hold on;
    normal_x = -3: 0.2: 3;
    normal_y = normpdf(normal_x, 0, 1);
    fitdist(w_i, 'Normal');
    scatter(normal_x, normal_y*65, 25);
    histfit(w_i);
    title('Standardized Residuals of the observations'); 
    xlabel('Standardized Residuals');
    ylabel('Frequency');
    hold off;
    image_num = 4;
    laserscanner_points = load('Test_scan006_withoutfloor_RightSide_withPointNumbers.txt');
    img = imread("img_" + image_num + ".jpg");
    [rgb_values, pixels_used] = backprojectDataset(laserscanner_points, img, EOPs(image_num, 3:5), EOPs(image_num, 6:8), IOPs(2:4), 1);
    [x, y] = getBackProjection([0.717019, -3.014253, 1092.510254].', EOPs(3, 3:5), EOPs(3, 6:8), IOPs(2:4), 1)
    %img_3(1833, 481, :)
    laserscanner_points = [laserscanner_points, rgb_values];
    dlmwrite("laser_scanner_points_rgb_sideimage_" + image_num + ".txt", laserscanner_points, 'precision', 10);
    
    
    correlation_matrices = printCorrelationMatrix(EOPs, IOPs, C_xhat);
    
    