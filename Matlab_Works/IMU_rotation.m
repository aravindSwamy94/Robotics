% R- Value taken from answer of 2.a
R = [1 0 0;0 0.933 0.36;0 -0.36 0.933];

% Given omega_IMU in 2.b
omega_IMU = [0.7 0.8 0];

%loop five times to get the updated R
for m= 1:5
    R = R + R*0.06*skew(omega_IMU);
end


R

% To get the Determminant of R 
det(R)
    