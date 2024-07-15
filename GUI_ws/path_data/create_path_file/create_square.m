clc;
clear;
L = 12.5;
resolution = 0.05;
x0 = linspace(-L/2,L,3/2*L/resolution);
y0 = zeros(size(x0));
yaw0 = y0;

y1 = linspace(0,L,L/resolution);
x1 = L*ones(size(y1));
yaw1 = pi/2*ones(size(y1));

x2 = linspace(L,0,L/resolution);
y2 = L*ones(size(x2));
yaw2 = pi*ones(size(y2));

y3 = linspace(L,0,L/resolution);
x3 = zeros(size(y3));
yaw3 = 3*pi/2*ones(size(y3));

x4 = linspace(0,L,L/resolution);
y4 = zeros(size(x4));
yaw4 = 2*pi*ones(size(y4));

yaw5 = 5/2*pi*ones(size(y1));
yaw6 = 3*pi*ones(size(y2));
yaw7 = 7/2*pi*ones(size(y3));

x = [x0 x1 x2 x3 x4 x1 x2 x3];
y = [y0 y1 y2 y3 y4 y1 y2 y3];
yaw = [yaw0 yaw1 yaw2 yaw3 yaw4 yaw5 yaw6 yaw7];

% Write x, y, yaw into circle_path.dat
fileID = fopen('square_path.dat', 'w');
fprintf(fileID, 'x_ref,y_ref,yaw_ref\n'); % Writing header
formatSpec = '%f,%f,%f\n';
for i = 1:numel(x)
    fprintf(fileID, formatSpec, x(i), y(i), yaw(i));
end
fclose(fileID);
