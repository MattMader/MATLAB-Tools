function P = P_elpm(x, epsilon)
% P_ELPM returns the penalty function from consfn(x)
%  using the extended-linear penalty method.
% Author: Matthew Mader
% Date: 10/17/21

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

end % function