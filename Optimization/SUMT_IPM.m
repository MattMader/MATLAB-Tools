% SUMT - Interior Penalty Method
% This script uses SUMT with an interior penalty function in
% order to solve constrained optimizations problems

%% Setup Workspace
clear,clc,close all
format long

%% SUMT Setup

% initial design (feasible)
x = [0.1; 1];

% cost coefficients computed experimentally from ratio of
% gradient magnitudes at x = [0.1, 1]^T
c = [1.89796e-04
    0.00189
    1.38033e-04
    0.00134
    8.34954e-04
    4.38559e-05
    7.72171e-04
    0.00116
    1.71789e-04];

% initial evaluation
f = objfn(x);
f_last = f*2; % force loop to run

% initial constraints
g = consfn(x);

% unconstrained optimizer setup
opts = optimoptions(@fminunc,'Algorithm', 'quasi-newton', ...
'Display', 'iter');

% penalty multiplier
r_p = 1; % initial value
gamma = 5;

% convergence tollerance
epsilon_f = 1e-4; % relative change in objective fn
epsilon_g = 1e-4; % max acceptable contraint

% SUMT loop
p = 1; % loop counter
while (abs((f-f_last)/f_last) > epsilon_f || max(g) > epsilon_g)
    
    % display iteration details
    fprintf("==========minimization %d:==========\n",p);
    fprintf("\tr_p = %f\n",r_p);
    fprintf("\tx0 = [%.4e,%.4e]^T\n",x(1),x(2));
    fprintf("\tf(x0) = %G\n\n",f);
    
    f_last = f; % store last obj fn
    
    % pseudo-objective unconstrained minimization
    [x_star, phi_star, flag, out] = fminunc(@phi_int,x,opts,r_p);
    
    % objective function and constraint evaluation
    f = objfn(x_star);
    g = consfn(x_star);
    
    % display constraint details
    fprintf("==========Results==========\n")
    fprintf("x* = [%.4e, %.4e]^T\n",x_star(1),x_star(2));
    fprintf("f(x*) = %.4e\n",f);
    fprintf("g(x*)=\n");
    fprintf("\t%.4e\n",g);
    fprintf("flag: %d\n",flag);
    fprintf("\n");
    
    % increase penalty function
    r_p = r_p/gamma;
    
    % new design vector
    x = x_star;
    
    p = p + 1; % increment counter
    
end % while