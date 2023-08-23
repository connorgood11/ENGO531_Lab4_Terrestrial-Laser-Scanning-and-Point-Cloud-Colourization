function [rgb_values, pixels_used] = backprojectDataset(dataset, image, eXYZ, wpk, IOPs, lhs)
%BACKPROJECTDATASET
rgb_values = zeros(size(dataset, 1), 3);
pixels_used = zeros(size(dataset, 1), 2);
for i = 1:size(dataset, 1)
   [pixel_x, pixel_y] = getBackProjection(dataset(i, 2:4).', eXYZ, wpk, IOPs, lhs);
   pixel_x = round(abs(pixel_x), 0);
   pixel_y = round(abs(pixel_y), 0);
   if pixel_x == 0
       pixel_x = 1;
   end
   if pixel_y == 0
       pixel_y = 1;
   end
   if pixel_y > size(image, 1) || pixel_x > size(image, 2)
       rgb_values(i, :) = [255, 255, 255];
   else
       pixels_used(i, :) = [pixel_x, pixel_y];
       rgb_values(i, :) = image(pixel_y, pixel_x, :);
   end
   % disp(i/size(dataset, 1)*100);
   
end
end

