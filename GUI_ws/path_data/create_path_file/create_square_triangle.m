clear;
clc;
L = 7;
resolution = 0.05;
y0 = linspace(0,L,L/resolution);
x0 = 2*L*ones(size(y0));
yaw0 = pi/2*ones(size(x0));

y1 = linspace(L,2*L,L/resolution);
x1 = linspace(2*L,L,L/resolution);
yaw1 = 3*pi/4*ones(size(x1));

x2 = linspace(L,-L,2*L/resolution);
y2 = 2*L*ones(size(x2));
yaw2 = pi*ones(size(x2));

x3 = linspace(-L,-2*L,L/resolution);
y3 = linspace(2*L,L,L/resolution);
yaw3 = 5/4*pi*ones(size(x3));

y4 = linspace(L,0,L/resolution);
x4 = -2*L*ones(size(y4));
yaw4 = 3/2*pi*ones(size(x4));

x5 = linspace(-2*L,0,2*L/resolution);
y5 = zeros(size(x5));
yaw5 = 2*pi*ones(size(x5));

x6 = linspace(0,L*cos(pi/3),L/resolution);
y6 = linspace(0,L*sin(pi/3),L/resolution);
yaw6 = 7/3*pi*ones(size(x6));

x7 = linspace(L*cos(pi/3),L,L/resolution);
y7 = linspace(L*sin(pi/3),0,L/resolution);
yaw7 = 5/3*pi*ones(size(x7));

x8 = linspace(L,0,L/resolution);
y8 = zeros(size(x8));
yaw8 = pi*ones(size(x8));

y9 = linspace(0,-L,L/resolution);
x9 = zeros(size(y9));
yaw9 = 3*pi/2*ones(size(x9));

x10 = linspace(0,-L,L/resolution);
y10 = -L*ones(size(x10));
yaw10 = pi*ones(size(x10));

y11 = linspace(-L,0,L/resolution);
x11 = -L*ones(size(y11));
yaw11 = pi/2*ones(size(x11));


x = [x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11];
y = [y0 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11];
yaw = [yaw0 yaw1 yaw2 yaw3 yaw4 yaw5 yaw6 yaw7 yaw8 yaw9 yaw10 yaw11];
% Write x, y, yaw into circle_path.dat
fileID = fopen('square_triangle_path.dat', 'w');
fprintf(fileID, 'x_ref,y_ref,yaw_ref\n'); % Writing header
formatSpec = '%f,%f,%f\n';
for i = 1:numel(x)
    fprintf(fileID, formatSpec, x(i), y(i), yaw(i));
end
fclose(fileID);