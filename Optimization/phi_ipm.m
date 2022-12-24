function phi = phi_ipm(x,r_p,c)
% phi_ipm returns the pseudo-objective function from objfn(x) and consfn(x)
%   using the log-barrier interior penalty method
%
% Inputs:
%   x: design vector
%   r_p: penalty multiplier
%   c: cost coefficients
%
% Output:
%   phi: pseudo-objective function value
%
% Information:
%   Author: Matthew Mader
%   Contact: maderm@purdue.edu
%   Date: 17 October 2021
%
% Notes:
%

f = objfn(x); % objective function value
g = consfn(x); % constraint function vector

% penalty function
P = 0;
for j = 1:length(g)
    P = P + -log(-g(j))*c(j);
end % for

% pseudo-objective function
phi = f + r_p*P;

end % function