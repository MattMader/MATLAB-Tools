% SUMT - Interior Penalty Method
% This script uses SUMT with an extended linear penalty function in
% order to solve constrained optimizational problems

%% Setup Workspace
clear,clc,close all
format long

%% SUMT Setup

% initial design (feasible)
x = [0.1; 1];

% initial evaluation
f = objfn(x);
f_last = f*2; % force loop to run

% initial constraints
g = consfn(x);

% initial lagrange multipliers
lambda = [0 0 0 0 0 0 0 0 0].';

% initial penalty multiplier
r_p = 1.0;
gamma = 5;

% unconstrained optimizer setup
opts = optimoptions(@fminunc,'Algorithm', 'quasi-newton', ...
'Display', 'iter');

% convergence tollerance
epsilon_f = 1e-4; % relative change in objective fn
epsilon_g = 1e-4; % max acceptable contraint

% SUMT loop
p = 1; % loop counter
while (abs((f-f_last)/f_last) > epsilon_f || max(g) > epsilon_g)
    
    f_last = f; % store last obj fn
    
    % pseudo-objective unconstrained minimization
    [x_star, phi_star, flag, out] = fminunc(@almfn,x,opts,lambda,r_p)
    
    % objective function and constraint evaluation
    f = objfn(x_star);
    g = consfn(x_star);
    
    % update langrange multipliers
    for j = 1:length(g)
        lambda(j) = lambda(j) + 2*r_p*max(g(j),-lambda(j)/(2*r_p)); % inequality
    end % for
    
    fprintf("=========Iterations %d==========\n",p);
    fprintf("rp=%f\n",r_p);
    fprintf("x0=[%.4e, %.4e]\n",x(1),x(2));    
    
    % new design vector
    x = x_star;
    
    fprintf("x*=[%.4e, %.4e]\n",x(1),x(2));
    fprintf("f(x*)=%.4e\n",f);
    fprintf("g(x*)=\n");
    fprintf("\t%.4e\n",g);
    fprintf("flag=%d\n",flag);
    
    % update rp
    r_p = r_p*gamma;
    
    p = p + 1; % increment counter
    
    fprintf("x0=[%.4e, %.4e]\n",x(1),x(2));
    
    if p > 15
        return
    end
    
end % while