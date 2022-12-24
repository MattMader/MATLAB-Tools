function epsilon_dot = KDE_EP(epsilon,omega)
% KDE_EP Kinematic differential equations for euler parameters
%
% Inputs:
%   epsilon: Euler Parameters (4x1) [-]
%   omega: Rotation rates in body frame (3x1) [rad/s]
%
% Outputs:
%   epsilon: Euler Parameters derivative (4x1) [1/s]
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 21 Feb 2022
%
% Notes:
%

A = [epsilon(4),-epsilon(3),epsilon(2),epsilon(1);
    epsilon(3),epsilon(4),-epsilon(1),epsilon(2);
    -epsilon(2),epsilon(1),epsilon(4),epsilon(3);
    -epsilon(1),-epsilon(2),-epsilon(3),epsilon(4)];

epsilon_dot = 0.5*A*[omega; 0];

end