function [r,v] = coes2rv(coes,mu)
% COES2RV Converts classical orbital elements into cartesian position and
% velocity vectors. Vectorized to work with N-dimensional vectors.
% Everything in ECI Equitorial coordinates.
%
%
% Inputs:
%   coes(:,1) = a: semi-major axis                  (Nx1) [L]
%   coes(:,2) = e: eccentricity                     (Nx1) [-]
%   coes(:,3) = i: inclination                      (Nx1) [rad]
%   coes(:,4) = omega: longitude of ascending node  (Nx1) [rad]
%   coes(:,5) = w: argument of periapsis            (Nx1) [rad]
%   coes(:,6) = nu: true anomaly                    (Nx1) [rad]
%
%   mu: standard gravitational parameter of central body (1x1) [L^3/T^2]
%
%
% Ouputs:
%   r: position vector (Nx3) [L]
%
%   v: velocity vector (Nx3) [L/T]
%
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 13 Mar 2022
%
%
% Notes:
%   https://downloads.rene-schwarz.com/download/M001-Keplerian_Orbit_Elements_to_Cartesian_State_Vectors.pdf

% dimension
N = size(coes,1);

% unpack
a = coes(:,1);      % (Nx1) [L]
e = coes(:,2);      % (Nx1) [-]
i = coes(:,3);      % (Nx1) [rad]
omega = coes(:,4);  % (Nx1) [rad]
w = coes(:,5);      % (Nx1) [rad]
nu = coes(:,6);     % (Nx1) [rad]

% eccentric anomaly
E = atan2(sqrt(1 - e.^2).*sin(nu),e + cos(nu)); % (Nx1) [rad]

% distance to central body
r_c = a.*(1-e.*cos(E)); % (Nx1) [L]

% position in the orbital frame
r_o = r_c.*[cos(nu),sin(nu),zeros(N,1)]; % (Nx3) [L]

% velocity in the orbital frame
v_o = sqrt(mu*a)./r_c.*[-sin(E),sqrt(1-e.^2).*cos(E),zeros(N,1)]; % (Nx3) [L/T]

% coordinate transformation (ECI Equitorial)
r(:,1) = r_o(:,1).*(cos(omega).*cos(w) - cos(i).*sin(omega).*sin(w)) - r_o(:,2).*(cos(omega).*sin(w) + cos(i).*cos(w).*sin(omega)) + r_o(:,3).*sin(i).*sin(omega);
r(:,2) = r_o(:,1).*(cos(w).*sin(omega) + cos(i).*cos(omega).*sin(w)) - r_o(:,2).*(sin(omega).*sin(w) - cos(i).*cos(omega).*cos(w)) - r_o(:,3).*cos(omega).*sin(i);
r(:,3) = r_o(:,3).*cos(i) + r_o(:,2).*cos(w).*sin(i) + r_o(:,1).*sin(i).*sin(w);

% coordinate transformation (ECI Equitorial)
v(:,1) = v_o(:,1).*(cos(omega).*cos(w) - cos(i).*sin(omega).*sin(w)) - v_o(:,2).*(cos(omega).*sin(w) + cos(i).*cos(w).*sin(omega)) + v_o(:,3).*sin(i).*sin(omega);
v(:,2) = v_o(:,1).*(cos(w).*sin(omega) + cos(i).*cos(omega).*sin(w)) - v_o(:,2).*(sin(omega).*sin(w) - cos(i).*cos(omega).*cos(w)) - v_o(:,3).*cos(omega).*sin(i);
v(:,3) = v_o(:,3).*cos(i) + v_o(:,2).*cos(w).*sin(i) + v_o(:,1).*sin(i).*sin(w);

end % function coes2rv