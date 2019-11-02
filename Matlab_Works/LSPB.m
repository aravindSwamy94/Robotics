clear all;
clc;
tf = 4; % Given time limit
theta_f = 65; % final position(in degrees)
theta_o = -10; % initial position(in degrees)
a = 30; % Acceleration of theta (ind deg/sec^2)

tb = (tf/2) - ((sqrt((a^2*tf^2)-(4*a*(theta_f-theta_o)))/(2*a))); % (The initial blend time)

tbo = tf - tb; % final time minus the beldn time, time where the blend region ends

theta_b =  theta_o+ 0.5*a* tb^2; % calculation of theta in blend time tb
theta_b_vel = a*tb; % vleocity at the blend time tb

t = 0:0.01:tf; 

r1 = (t < tb);  % region 1 with increasing velocity
 
r2 = (t>=tb) & (t<tbo); % region 2 with constant velocity

r3 = (t>=tbo); % region 3 with decreasing velocity

pos= zeros(size(t)); 
vel= zeros(size(t));
acc= zeros(size(t));

% Calculation of position in the three regions
pos(r1) = theta_o + (0.5*a*t(r1).^2 );
pos(r2) = theta_o - (0.5*a*tb.^2) + (theta_b_vel*t(r2));
%pos(r2) = theta_b + (theta_b_vel*t(r2));
pos(r3) = theta_f - (0.5*a*(tf-t(r3)).^2);
%plot(pos)

%Calculations of Velocity in the three regions
vel(r1) = a*t(r1);
vel(r2) = theta_b_vel;
vel(r3) = a*(tf-t(r3));
%plot(vel)

%Calculations of acceleration in the three regions
acc(r1) = a;
acc(r2) = 0.0;
acc(r3) = -a;

%Plot the figure
figure;
subplot(3,1,1);
plot(pos);
title('Position');
subplot(3,1,2);
plot(vel);
title('Velocity');
subplot(3,1,3);
plot(acc);
title('Acceleration');