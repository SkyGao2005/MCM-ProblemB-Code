figure
f = @(x, y) 1/2/pi*exp(-(x.^2 + y.^2)/2);

x = linspace(-3, 3, 500);
y = linspace(-3, 3, 500);
[X, Y] = meshgrid(x, y);
Z = f(X, Y);

colormap('jet');
imagesc(x, y, Z);
colorbar;

xlabel('x');
ylabel('y');

hold on;
scatter(0, 0, 30, 'cyan','filled');
hold off;

figure;
[x, y] = meshgrid(-3:0.1:3, -3:0.1:3);
z = 1/(2*pi)*exp(-(x.^2 + y.^2)/2);

surf(x, y, z);
colormap('jet');
colorbar;
xlabel('x');
ylabel('y');
hold on;

theta = 0:0.01:2*pi;
x_circle = cos(theta);
y_circle = sin(theta);
z_circle = 1/(2*pi)*exp(-(x_circle.^2 + y_circle.^2)/2);
plot3(x_circle, y_circle, z_circle, 'k', 'LineWidth', 2);