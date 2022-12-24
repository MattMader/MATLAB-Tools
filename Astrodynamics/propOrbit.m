function [t,r,v] = propOrbit(r0,v0,mu,tspan,N)

% initial state
x0 = [r0(:); v0(:)];

% integrator options
opts = odeset('AbsTol',1e-12,'RelTol',1e-12);

% integration
sol = ode113(@(t,x)odefun(x,mu),tspan,x0,opts);

% user requested number of output points
if nargin > 4
    t = linspace(tspan(1),tspan(2),N)';
    x = deval(sol,t)';
    r = x(:,1:3);
    v = x(:,4:6);
else    
    t = sol.x';
    x = sol.y';
    r = x(:,1:3);
    v = x(:,4:5);
end % if

end

%% Equations of Motion
function dxdt = odefun(x,mu)

% initialize output
dxdt = zeros(size(x));

% position
r = x(1:3);

% velocity
v = x(4:6);

% acceleration
a = -mu/norm(r)^3*r;

% state derivatives
dxdt(1:3) = v;
dxdt(4:6) = a;

end % odefun