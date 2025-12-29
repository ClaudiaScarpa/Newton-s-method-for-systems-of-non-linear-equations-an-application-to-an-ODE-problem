%% Main Script: Newton Method for Non-linear BVPs
% This script replicates the numerical tests from the Bachelor's Thesis.

clear all; clc;

% --- CHOOSE EXAMPLE TO TEST ---
test_case = 3; % Change this to 1, 2, or 3

switch test_case
    case 1 
        % EXAMPLE 1: Linear-like test
        % y'' - y = 0, y(0)=0, y(1)=1 -> Sol: sinh(x)/sinh(1)
        x_start = 0; x_end = 1; y_start = 0; y_end = 1;
        syms F(x,y) P(x);
        F(x,y) = -y; P(x) = 0;
        analytical_sol = @(x) sinh(x)/sinh(1);

    case 2
        % EXAMPLE 2: Simple Non-linear
        % y'' + exp(y) = 0
        x_start = 0; x_end = 1; y_start = 0; y_end = 0;
        syms F(x,y) P(x);
        F(x,y) = exp(y); P(x) = 0;
        analytical_sol = @(x) NaN; % No simple analytical sol provided

    case 3
        % EXAMPLE 4.11: The Main Thesis Example
        % y'' - 10y' + (1/x^2 + 10/x + x - e^y) = 0
        x_start = 1; x_end = exp(1); y_start = 0; y_end = 1;
        syms F(x,y) P(x);
        F(x,y) = 1/(x^2) + 10/x + x - exp(y);
        P(x) = -10;
        analytical_sol = @(x) log(x);
end

% --- PARAMETERS ---
n_points = 16; 
h = (x_end - x_start)/n_points;
guess = linspace(y_start, y_end, n_points+1); 
guess = guess(2:end-1); % Initial linear guess

% --- SOLVER ---
[solution, niter, err] = newton_method(guess, y_start, y_end, x_start, x_end, F, P, 100, 1e-12);

% --- VISUALIZATION ---
x_nodes = linspace(x_start, x_end, n_points+1);
plot(x_nodes, [y_start, solution, y_end], '-ob', 'DisplayName', 'Numerical');
hold on;
if ~isnan(analytical_sol(x_start))
    fplot(analytical_sol, [x_start, x_end], 'r', 'DisplayName', 'Analytical');
    
    % Error Calculation
    y_ana = analytical_sol(x_nodes(2:end-1));
    max_err = norm(solution - y_ana, Inf);
    fprintf('Max Error (L-inf): %e\n', max_err);
end
grid on; legend;
title(['BVP Solution - Example ', num2str(test_case)]);
xlabel('x'); ylabel('y(x)');