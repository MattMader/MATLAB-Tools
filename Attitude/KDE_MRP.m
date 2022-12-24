function sigma_dot = KDE_MRP(sigma,omega)
% KDE_MRP Kinematic differential equations for modified Rodrigues parameter
%
% Inputs:
%   sigma: Modified Rotrigues parameter (3x1) [-]
%   omega: Rotation rates in body frame (3x1) [rad/s]
%
% Outputs:
%   sigma_dot: Modified Rotrigues parameter derivative (3x1) [1/s]
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 21 Feb 2022
%
% Notes:
%

sigma_dot = 0.25*((1-dot(sigma,sigma))*omega+2*cross(sigma,omega)+2*dot(omega,sigma)*sigma);

end