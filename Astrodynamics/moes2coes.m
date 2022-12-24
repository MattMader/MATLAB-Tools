function coes = moes2coes(moes)
% MOES2COES Converts modified orbital elements into classical orbital
% elements. Vectorized to work with N-dimensional vectors. Everything in
% ECI Equitorial coordinates.
%
%
% Inputs:
%   moes(:,1) = p: semilatus rectum [L]
%   moes(:,2) = f: x eccentricity vector (orbital frame) [-]
%   moes(:,3) = g: y eccentricity vector (orbital frame) [-]
%   moes(:,4) = h: x node vector (orbital frame) [-]
%   moes(:,5) = k: y node vector (orbital frame) [-]
%   moes(:,6) = L: true longitude [rad]
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
%   Contact: matthewjmader@gmail.com
%   Date: 13 Mar 2022
%
%
% Notes:
%   https://spsweb.fltops.jpl.nasa.gov/portaldataops/mpg/MPG_Docs/Source%20Docs/EquinoctalElements-modified.pdf

% unpack
p = moes(:,1); % (Nx1) [L]
f = moes(:,2); % (Nx1) [-]
g = moes(:,3); % (Nx1) [-]
h = moes(:,4); % (Nx1) [-]
k = moes(:,5); % (Nx1) [-]
L = moes(:,6); % (Nx1) [rad]

% compute coes
a = p./(1 - f.*f - g.*g); % (Nx1) [L]
e = sqrt(f.*f + g.*g); % (Nx1) [-]
i = atan2(2*sqrt(h.*h + k.*k), 1 - h.*h - k.*k); % (Nx1) [rad]
w = atan2(g.*h - f.*k, f.*h + g.*k); % (Nx1) [rad]
omega = atan2(k,h); % (Nx1) [rad]
nu = L - atan2(g,f); % (Nx1) [rad]

% constrain coes
omega = mod(omega,2*pi); % (Nx1) [rad]
nu = mod(nu,2*pi); % (Nx1) [rad]


% output
coes = [a,e,i,omega,w,nu]; % (Nx6) [L,-,rad,rad,rad,rad]

end % function moes2coes