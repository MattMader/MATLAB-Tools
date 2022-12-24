function rho_dot = KDE_CRP(rho,omega)
% KDE_CRP Kinematic differential equations for classical Rodrigues 
%   parameters
%
% Inputs:
%   rho: Classical Rotrigues parameter (3x1) [-]
%   omega: Rotation rates in body frame (3x1) [rad/s]
%
% Outputs:
%   rho_dot: Classical Rotrigues parameter derivative (3x1) [1/s]
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 21 Feb 2022
%
% Notes:
%

A = zeros(3,3);

A(1,1) = 1 + rho(1)^2;
A(1,2) = rho(1)*rho(2) - rho(3);
A(1,3) = rho(1)*rho(3) + rho(2);
A(2,1) = rho(2)*rho(1) + rho(3);
A(2,2) = 1 + rho(2)^2;
A(2,3) = rho(2)*rho(3) - rho(1);
A(3,1) = rho(3)*rho(1) - rho(2);
A(3,2) = rho(3)*rho(2) + rho(1);
A(3,3) = 1 + rho(3)^2;

rho_dot = 0.5*A*omega(:);

end