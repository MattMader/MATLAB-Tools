function C = MRPtoDCM(sigma)
% MRPtoDCM computes DCM from the modified Rodrigues parameter
%
% Inputs:
%   sigma: Modofied Rotrigues parameter (3x1) [-]
%
% Outputs:
%   C: Direction cosine matrix (3x3) [-]
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 21 Feb 2022
%
% Notes:
%

% sigma cross matrix
scm = [0,-sigma(3),sigma(2)
    sigma(3),0,-sigma(1)
    -sigma(2),sigma(1),0];

% compute DCM
C = eye(3) + (8*scm*scm-4*(1-dot(sigma,sigma))*scm)/(1+dot(sigma,sigma))^2;

end % function DCMtoMRP