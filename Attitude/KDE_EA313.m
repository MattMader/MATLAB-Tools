function theta_dot = KDE_EA313(theta,omega)
% KDE_EA313 Kinematic differential equations for the (3-1-3) sequence of
%   Euler angles
%
% Inputs:
%   theta: Euler angles (3x1) [rad]
%   omega: Rotation rates in body frame (3x1) [rad/s]
%
% Outputs:
%   theta_dot: Euler angles derivative (3x1) [rad/s]
%
% Information:
%   Author: Matthew Mader
%   Contact: maderm@purdue.edu
%   Date: 21 Feb 2022
%
% Notes:
%

A = [sin(theta(3)), cos(theta(3)), 0;
    cos(theta(3))*sin(theta(2)), -sin(theta(3))*sin(theta(2)), 0;
    -sin(theta(3))*cos(theta(2)), -cos(theta(3))*cos(theta(2)), sin(theta(2))];

theta_dot = 1/sin(theta(2))*A*omega;

end