function coes = rv2coes(r,v,mu)
% RV2COES Converts caresian position and velocity vectors to classical
% orbital elements. Vectorized to work with N-dimensional vectors.
% Everything in ECI Equitorial coordinates.
%
%
% Inputs:
%   r: position vector (Nx3) [L]
%
%   v: velocity vector (Nx3) [L/T]
%
%   mu: standard gravitational parameter of central body (1x1) [L^3/T^2]
%
%
% Ouputs:
%   coes(:,1) = a: semi-major axis (Nx1) [L]
%   coes(:,2) = e: eccentricity (Nx1) [-]
%   coes(:,3) = i: inclination (Nx1) [rad]
%   coes(:,4) = omega: longitude of ascending node (Nx1) [rad]
%   coes(:,5) = w: argument of periapsis (Nx1) [rad]
%   coes(:,6) = nu: true anomaly (Nx1) [rad]
%
%
% Information:
%   Author: Matthew Mader
%   Contact: maderm@purdue.edu
%   Date: 13 Mar 2022
%
%
% Notes:
%   https://downloads.rene-schwarz.com/download/M002-Cartesian_State_Vectors_to_Keplerian_Orbit_Elements.pdf

% dimension
N = size(r,1);

% orbital momentum vector
h = cross(r,v,2); % (Nx3) [L^2/T]

% eccentricity vector
e_vec = cross(v,h,2)/mu - r./vecnorm(r,2,2); % (Nx3) [-]

% prevent errors with circular orbits
e_vec(vecnorm(e_vec,2,2) < 1e-9,:) = 0; % (Nx3) [-]

% eccentricity
e = vecnorm(e_vec,2,2); % (Nx1) [-]

% vector pointing towards ascending node
n = [-h(:,2), h(:,1), zeros(N,1)]; % (Nx3) [L^2/T]

% true anomaly
nu = acos(dot(e_vec,r,2)./e./vecnorm(r,2,2)); % (Nx1) [rad]
nu(dot(r,v,2) < 0) = 2*pi - nu(dot(r,v,2) < 0); % (Nx1) [rad]

% inclination
i = acos(h(:,3)./vecnorm(h,2,2)); % (Nx1) [rad]

% longitude of the ascending node
omega = acos(n(:,1)./vecnorm(n,2,2)); % (Nx1) [rad]
omega(n(:,2) < 0) = 2*pi - omega(n(:,2) < 0); % (Nx1) [rad]

% argument of periapsis
w = acos(dot(n,e_vec,2)./vecnorm(n,2,2)./e); % (Nx1) [rad]
w(e_vec(:,3) < 0) = 2*pi - w(e_vec(:,3) < 0); % (Nx1) [rad]

% semi-major axis
a = 1./(2./vecnorm(r,2,2)-vecnorm(v,2,2).^2/mu); % (Nx1) [L]

% classical orbital elements
coes = [a,e,i,omega,w,nu]; % (Nx6) [L,-,rad,rad,rad,rad]

end % function