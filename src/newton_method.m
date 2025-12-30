function [guess, niter, err] = newton_method(guess, y_start, y_end, x_start, x_end, F, P, nmax, toll)
% Solves a non-linear BVP: y'' + P(x)y' + F(x,y) = 0 
% with boundary conditions y(x_start) = y_start, y(x_end) = y_end 

n = length(guess) + 1; % Number of sub-intervals 
h = (x_end - x_start)/n; % Step size 
x_grid = linspace(x_start, x_end, n+1);

% Check existence and uniqueness condition (Mh < 2) 
w = abs(P(x_grid));
M = max(w);

if M*h > 2
   error('Uniqueness condition not satisfied: M*h = %f > 2', M*h);
else
    % Create symbolic variables for the unknowns
    syms y [1, n-1]

    % Define the non-linear system 
    f_sys = central_differences(y, x_grid, h, n, y_start, y_end, F, P);
    
    % Calculate the Jacobian matrix 
    J_mat = jacobian(f_sys, y); 
    
    for j = 1:nmax
        current_y = guess;
        % Evaluate Jacobian and Function at the current guess 
        Jf = double(subs(J_mat, y, current_y));
        F_val = double(subs(f_sys, y, current_y));
        
        % Solve J * delta = -F using Thomas Algorithm 
        delta = thomas_algorithm(Jf, -F_val');
        
        guess = current_y + delta';
        niter = j;
        err = norm(guess - current_y, Inf);

        if err < toll
            fprintf('Convergence reached at iteration %d\n', j);
            return; 
        end
    end
end
end

