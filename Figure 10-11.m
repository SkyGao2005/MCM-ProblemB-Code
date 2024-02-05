std = 1;
l = @(r) 1./(2.*pi.*std.^2).*exp(-(r.^2)/(2.*std.^2)).*r;
f = @(x,y) integral(l,0,x)*y;

init = 0.25;
v = 0.5;
r=init;
figure;
t = linspace(0,2*pi/v*r,100);
lst = 2*pi/v*r;
p = f(2*r,t*v/r);

p1 = plot(t,p,'LineWidth',3,'Color','#62A8AC');
hold on;
for i=1:4
    r=init*(i*2+1);
    t = linspace(lst,lst+2*pi/v*r,100);
    p = f(r+init,(t-lst)*v/r)+f(r-init,2*pi-(t-lst)*v/r);
    lst = lst+2*pi/v*r;
    plot(t,p,'LineWidth',3,'Color','#62A8AC');
    hold on;
end

init = 0.25;
v = 1;
r=init;
t = linspace(0,2*pi/v*r,100);
lst = 2*pi/v*r;
p = f(2*r,t*v/r);
p2 = plot(t,p,'LineWidth',3,'Color','#ACF39D');
hold on;
for i=1:4
    r=init*(i*2+1);
    t = linspace(lst,lst+2*pi/v*r,100);
    p = f(r+init,(t-lst)*v/r)+f(r-init,2*pi-(t-lst)*v/r);
    lst = lst+2*pi/v*r;
    plot(t,p,'LineWidth',3,'Color','#ACF39D');
    hold on;
end

init = 0.25;
v = 0.25;
r=init;
t = linspace(0,2*pi/v*r,100);
lst = 2*pi/v*r;
p = f(2*r,t*v/r);

p3 = plot(t,p,'LineWidth',3,'Color','#af3e4d');
hold on;
for i=1:4
    r=init*(i*2+1);
    t = linspace(lst,lst+2*pi/v*r,100);
    p = f(r+init,(t-lst)*v/r)+f(r-init,2*pi-(t-lst)*v/r);
    lst = lst+2*pi/v*r;
    plot(t,p,'LineWidth',3,'Color','#af3e4d');
    hold on;
end
legend([p1 p2 p3],{'v=0.5','v=1','v=0.25'},'Location','southeast');
%legend('n=1','n=2','n=3','n=4','n=5','n=6','Location','southeast');