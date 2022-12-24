% SUMT - Exterior Penalty Method
% This script uses SUMT with an exterior penalty function in
% order to solve constrained optimization problems

%% Setup Workspace
clear,clc,close all
format long

%% SUMT Setup

% initial design (feasible)
x = [0.05; 1.0];

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
epsilon_f = 1e-4;
epsilon_g = 1e-4;

% SUMT loop
p = 1; % loop counter
while (abs((f-f_last)/f_last) > epsilon_f || max(g) > epsilon_g)
    
    f_last = f; % store last obj fn
    
    % pseudo-objective unconstrained minimization
    [x_star, phi_star, flag, out] = fminunc(@phi_ext,x,opts,r_p);
    out
    
    % objective function and constraint evaluation
    f = objfn(x_star);
    g = consfn(x_star);
    
    fprintf("=========Iterations %d==========\n",p);
    fprintf("rp=%f\n",r_p);
    fprintf("x0=[%.4e, %.4e]\n",x(1),x(2));  
    
    % increase penalty function
    r_p = r_p*gamma;
    
    % new design vector
    x = x_star;
    
    fprintf("x*=[%.4e, %.4e]\n",x(1),x(2));
    fprintf("f(x*)=%.4e\n",f);
    fprintf("g(x*)=\n");
    fprintf("\t%.4e\n",g);
    fprintf("flag=%d\n",flag);
    
    p = p + 1; % increment counter
    
end % while