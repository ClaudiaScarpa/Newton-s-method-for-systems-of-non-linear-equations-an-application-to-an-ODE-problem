function x = thomas_algorithm(A, b_vec)
% Thomas Algorithm for solving tridiagonal systems Ax = b 
% Optimized for memory and speed 

diag_main = diag(A);
m = length(diag_main);

% Extract sub and super diagonals
upper_diag = zeros(m-1, 1);
lower_diag = zeros(m-1, 1);

for i = 1:m-1
    upper_diag(i) = A(i, i+1);
    lower_diag(i) = A(i+1, i);
end

% Forward elimination
alpha = zeros(m, 1);
beta = zeros(m-1, 1);
y = zeros(m, 1);

alpha(1) = diag_main(1);
y(1) = b_vec(1);

for i = 1:m-1
    beta(i) = lower_diag(i) / alpha(i);
    alpha(i+1) = diag_main(i+1) - beta(i) * upper_diag(i);
    y(i+1) = b_vec(i+1) - beta(i) * y(i);
end

% Backward substitution
x = zeros(m, 1);
x(m) = y(m) / alpha(m);
for i = m-1:-1:1
    x(i) = (y(i) - upper_diag(i) * x(i+1)) / alpha(i);
end
end

