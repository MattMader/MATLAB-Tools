function sigma_s = MRPtoShadow(sigma)
% MRPtoShadow computes shadow set for a modified Rodrigues parameter
%
% Inputs:
%   sigma: Modofied Rotrigues parameter (3x1) [-]
%
% Outputs:
%   sigma_s: Modofied Rotrigues parameter shadow set (3x1) [-]
%
% Information:
%   Author: Matthew Mader
%   Contact: maderm@purdue.edu
%   Date: 21 Feb 2022
%
% Notes:
%

sigma_s = -sigma/dot(sigma,sigma);

end