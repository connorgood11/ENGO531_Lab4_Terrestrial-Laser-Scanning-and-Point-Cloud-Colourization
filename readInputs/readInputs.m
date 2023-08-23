function [IOPs, CON, EOPs, PHO, TIE] = readInputs()
    IOPs = load('IOPs.txt'); % camera, xp, yp, c
    CON = load('Control.txt'); %  Point, X, Y Z
    EOPs = load('EOPs.txt'); % image, camera, Xc, Yc, Zc, omega, phi, kappa
    PHO = load('PHO.txt'); %  point, image, x, y
    TIE = load('Control.txt'); %  Point, X, Y, Z
end

