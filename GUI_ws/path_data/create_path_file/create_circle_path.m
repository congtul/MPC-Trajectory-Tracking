clc;
clear;
close all;
R = 6;
start = -3;
x1 = linspace(start,0,300);
y1 = -R*ones(size(x1));
yaw1 = zeros(size(x1));
for i = 1:720
    x2(i) = R*cos(-pi/2 + 1/2*(i)/180*pi);
    y2(i) = R*sin(-pi/2 + 1/2*(i)/180*pi);
    yaw2(i) = i/2/180*pi;
    yaw3(i) = yaw2(i) + 2*pi;
    yaw4(i) = yaw3(i) + 2*pi;
end
x = [x1 x2 x2 x2];
y = [y1 y2 y2 y2];
yaw = [yaw1 yaw2 yaw3 yaw4];

% Write x, y, yaw into circle_path.dat
fileID = fopen('circle_path.dat', 'w');
fprintf(fileID, 'x_ref,y_ref,yaw_ref\n'); % Writing header
formatSpec = '%f,%f,%f\n';
for i = 1:numel(x)
    fprintf(fileID, formatSpec, x(i), y(i), yaw(i));
end
fclose(fileID);