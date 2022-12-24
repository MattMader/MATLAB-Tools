function phi = phi_elpm(x, r_p, epsilon)
% phi_elpm returns the pseudo-objective function from objfn(x) and
%   consfn(x) using the extended-linear penalty method
%
% Inputs:
%   x: design vector
%   r_p: penalty multiplier
%   epsilon: transition value
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

f = objfn(x); % objective function value
g = consfn(x); % constraint function vector

% penalty function
P = 0;
for j = 1:length(g)
    if g(j) <= epsilon
        P = P - 1/g(j);
    else
        P = P - (2*epsilon-g(j))/epsilon^2;
    end % if/else
end % for

% pseudo-objective function
phi = f + r_p*P;

end % function