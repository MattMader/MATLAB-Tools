function sigma3 = MRPsub(sigma1,sigma2)
% MRPsub computes the subtraction between two modified Rodrigues parameters
%
% Inputs:
%   sigma1: First modified Rotrigues parameter (3x1) [-]
%   sigma2: Second modified Rotrigues parameter (3x1) [-]
%
% Outputs:
%   sigma3: Resultant modified Rotrigues parameter (3x1) [-]
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 21 Feb 2022
%
% Notes:
%

sigma3 = (1-norm(sigma2)^2)*sigma1-(1-norm(sigma1)^2)*sigma2-2*cross(sigma1,sigma2)/...
    (1+norm(sigma2)^2*norm(sigma1)^2+2*dot(sigma2,sigma1));

end