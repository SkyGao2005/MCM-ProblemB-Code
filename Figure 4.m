figure;

rng("shuffle");
initialPosition = rand(1,3);
initialPosition(1) = initialPosition(1)*10;
initialPosition(2) = initialPosition(2)*10;
initialPosition(3) = -2700+initialPosition(3)*-200;
v = rand(1,3)*2;
thrust = rand(1,3);
thrust(3) = thrust(3)-0.25;
resistenceK = 0.2;

deltaT = 0.1;
SimulationDuration = 75;

pos = zeros(SimulationDuration/deltaT + 1,3);
pos(1, :) = initialPosition;

for t = 1:SimulationDuration/deltaT
    randomFlow = rand(1,3)-0.5;
    acc = thrust-resistenceK*[v(1)^2*abs(v(1))/v(1), v(2)^2*abs(v(2))/v(2), v(3)^2*abs(v(3))/v(3)]+randomFlow;
    pos(t+1, :) = pos(t,:) + v*deltaT + 0.5*acc*deltaT*deltaT;
    v = v + acc*deltaT;
end

plot3(pos(:,1),pos(:,2),pos(:,3),'LineWidth',2,'color','red');
hold on;

initialStd = 1;
stdIncreaseRate = 0.05;
zSlice = initialPosition(3);

for t = 1:200
    std = initialStd + (t-1) * stdIncreaseRate;
    [X, Y] = meshgrid(linspace(0, 300, 100), linspace(0, 300, 100));
    P = exp(-((X-pos(t, 1)).^2 + (Y-pos(t, 2)).^2) / (2*std^2));
    surf(X, Y, zSlice*ones(size(X)), P, 'EdgeColor', 'none');
    colormap('jet');
    alpha(0.5);
    zSlice = pos(t+1,3);
    t=t+10;
end
colorbar;
