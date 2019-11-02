clear all;

% R-Matrix from 2.a
R = [1 0 0;0 0.933 0.36;0 -0.36 0.933];

%loop over 5 times and normalize the matrices
for m=1:5

    % c3' = c3
    %c1' =  c2 * c3'
    R(1:3,1) = cross(R(1:3,2),R(1:3,3));

    %c2' = c3' * c1'
    R(1:3,2) = cross(R(1:3,3),R(1:3,1));

    %c1'' = c1'/norm(c1')
    R(1:3,1) = R(1:3,1)/norm(R(1:3,1));

    %c2'' = c2'/norm(c2')
    R(1:3,2) = R(1:3,2)/norm(R(1:3,2));

    %c3'' = c3/norm(c3')
    R(1:3,3) = R(1:3,3)/norm(R(1:3,3));
    
end

%display the R matrix
R

% display the determinant of R
det(R)