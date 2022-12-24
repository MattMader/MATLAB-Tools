function C = CRPtoDCM(rho)
% CRPtoDCM computes the DCM from the classical Rodrigues parameter
%
% Inputs:
%   rho: Classical Rotrigues parameter (3x1) [-]
%
% Outputs:
%   C: Direction cosine matrix (3x3) [-]
%
% Information:
%   Author: Matthew Mader
%   Contact: maderm@purdue.edu
%   Date: 21 Feb 2022
%
% Notes:
%

arguments
    rho (3,1) {mustBeReal}
end % arguments

% initialize output
C = zeros(3,3); % (3x3) [-]

% DCM elements (need to be divided)
C(1,1) = 1+rho(1)^2-rho(2)^2-rho(3)^2;
C(1,2) = 2*(rho(1)*rho(2)+rho(3));
C(1,3) = 2*(rho(1)*rho(3)-rho(2));
C(2,1) = 2*(rho(1)*rho(2)-rho(3));
C(2,2) = 1-rho(1)^2+rho(2)^2-rho(3)^2;
C(2,3) = 2*(rho(2)*rho(3)+rho(1));
C(3,1) = 2*(rho(1)*rho(3)+rho(2));
C(3,2) = 2*(rho(2)*rho(3)-rho(1));
C(3,3) = 1-rho(1)^2-rho(2)^2+rho(3)^2;

% final DCM
C = C/(1+dot(rho,rho));

end % function CRPtoDCM