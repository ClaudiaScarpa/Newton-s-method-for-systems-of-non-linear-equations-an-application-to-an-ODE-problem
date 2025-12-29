function [f] = central_differences(y, x_grid, h, n, y_start, y_end, F, P)
% Constructs the system of non-linear equations using central differences
% for the BVP: y'' + P(x)y' + F(x,y) = 0 [cite: 375, 387]

syms f [1, n-1]

% First interior node [cite: 392]
f(1) = (y_start - 2*y(1) + y(2))/h^2 + F(x_grid(2), y(1)) + P(x_grid(2))*((y(2) - y_start)/(2*h));

% Intermediate nodes [cite: 392]
for i = 2:n-2
    f(i) = (y(i-1) - 2*y(i) + y(i+1))/h^2 + F(x_grid(i+1), y(i)) + P(x_grid(i+1))*((y(i+1) - y(i-1))/(2*h));
end

% Last interior node [cite: 393]
f(n-1) = (y(n-2) - 2*y(n-1) + y_end)/h^2 + F(x_grid(n), y(n-1)) + P(x_grid(n))*((y_end - y(n-2))/(2*h));
end
