function A = phi_alm(x,lambda,r_p)
% phi_alm returns the pseudo-objective function from objfn(x), consfn(x)
%   and Langrane Multipliers using the augmented Langrange multiplier
%   method.
%
% Inputs:
%   x: design vector
%   lambda: Langrange multipliers
%   r_p: penalty multiplier
%
% Output:
%   phi: pseudo-objective function value
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 17 October 2021
%
% Notes:
%

f = objfn(x);
g = consfn(x);

A = f;
for j = 1:length(g)
    A = A + lambda(j)*max(g(j),-lambda(j)/(2*r_p)) + ...
        r_p*max(g(j),-lambda(j)/(2*r_p))^2;
end % for

end % function