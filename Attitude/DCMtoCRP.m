function rho = DCMtoCRP(C)
% DCMtoCRP computes the classical Rodrigues parameter from a DCM
%
% Inputs:
%   C: Direction cosine matrix (3x3) [-]
%
% Outputs:
%   rho: Classical Rotrigues parameter (3x1) [-]
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 21 Feb 2022
%
% Notes:
%   Passed tests against MATLAB's dcm2rod function.
%

arguments

    C (3,3) {mustBeReal}
    
end % arguments

% compute classical Rotrigues parameter
rho = 1/(trace(C)+1)*...
   [C(2,3)-C(3,2)
    C(3,1)-C(1,3)
    C(1,2)-C(2,1)];

end % function DCMtoCRP