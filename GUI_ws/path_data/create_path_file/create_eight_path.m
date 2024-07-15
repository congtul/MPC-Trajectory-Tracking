clear;
clc;
R = 6.5;
resolution = 0.05;
x0 = linspace(-3*R,-2*R,R/resolution);
y0 = zeros(size(x0));
yaw0 = y0;
for i = 1:360
    x1(i) = -R + R*cos(pi - i/2*pi/180);
    y1(i) = R*sin(pi - i/2*pi/180);
    yaw1(i) = pi/2 - i/2*pi/180;
    x3(i) = -R + R*cos(-i/2*pi/180);
    y3(i) = R*sin(-i/2*pi/180);
    yaw3(i) = 3*pi/2 -i/2*pi/180;
end
for i = 1:720
    x2(i) = R + R*cos(-pi + i/2*pi/180);
    y2(i) = R*sin(-pi + i/2*pi/180);
    yaw2(i) = -pi/2 + i/2*pi/180;
end
x = [x0 x1 x2 x3];
y = [y0 y1 y2 y3];
yaw = [yaw0 yaw1 yaw2 yaw3];

% Write x, y, yaw into circle_path.dat
fileID = fopen('eight_path.dat', 'w');
fprintf(fileID, 'x_ref,y_ref,yaw_ref\n'); % Writing header
formatSpec = '%f,%f,%f\n';
for i = 1:numel(x)
    fprintf(fileID, formatSpec, x(i), y(i), yaw(i));
end
fclose(fileID);