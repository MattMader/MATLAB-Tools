function phi = phi_epm(x,r_p)
% phi_epm returns the pseudo-objective function from objfn(x) and consfn(x)
%   using the exterior penalty method.
%
% Inputs:
%   x: design vector
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

f = objfn(x); % objective function value
g = consfn(x); % constraint function vector

% penalty function
P = 0;
for j = 1:length(g)
    P = P + max(0,g(j))^2;
end % for

% pseudo-objective function
phi = f + r_p*P;

end % function