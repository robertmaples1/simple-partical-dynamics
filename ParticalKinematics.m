clear
clc
%This program gives the fastest time for a particle to travel on a straight
%ramp for any given height(y-intercept), and for any length (x-intercept)
%and gives the equation for partical motion
format compact;
format short;
g=(-9.81);
hprompt =('enter y-intercept: ');
wprompt =('enter x-intercept: ');
h = input(hprompt);
w= input(wprompt);
y0=[0,h];
x0= [w,0];
y= polyfit(x0,y0,1);
dy = polyder(y);
fun = @(xn)(sqrt(1+(dy)^2))./(sqrt(2*g*(polyval(y,xn)-h)));
t=integral(fun,0,w,'ArrayValued',true);

plot(x0,y)
grid
xlabel('x')
ylabel('y')
title('Position Function for Shortest Time')

fprintf('\n');
fprintf('Shortest possible time:  t= %.5f seconds\n',t)
fprintf('Position function for shortest time:  y(x)= %.1f*x + %d\n', dy,h)