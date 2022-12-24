function moes = coes2moes(coes)
% COES2MOES Converts classical orbital elements into modified orbital
% elements. Vectorized to work with N-dimensional vectors. Everything in
% ECI-J2000 Equitorial coordinates.
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
%
% Ouputs:
%   moes(:,1) = p: semilatus rectum                         (Nx1) [L]
%   moes(:,2) = f: x eccentricity vector (orbital frame)    (Nx1) [-]
%   moes(:,3) = g: y eccentricity vector (orbital frame)    (Nx1) [-]
%   moes(:,4) = h: x node vector (orbital frame)            (Nx1) [-]
%   moes(:,5) = k: y node vector (orbital frame)            (Nx1) [-]
%   moes(:,6) = L: true longitude                           (Nx1) [rad]
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
a = coes(:,1);      % (Nx1) [L]
e = coes(:,2);      % (Nx1) [-]
i = coes(:,3);      % (Nx1) [rad]
omega = coes(:,4);  % (Nx1) [rad]
w = coes(:,5);      % (Nx1) [rad]
nu = coes(:,6);     % (Nx1) [rad]

% compute moes
p = a.*(1-e.^2);            % (Nx1) [L]
f = e.*cos(w + omega);      % (Nx1) [-]
g = e.*sin(w + omega);      % (Nx1) [-]
h = tan(i/2).*cos(omega);   % (Nx1) [-]
k = tan(i/2).*sin(omega);   % (Nx1) [-]
L = omega + w + nu;         % (Nx1) [rad]

% constrain moes
L = mod(L,2*pi); % (Nx1) [rad]

% output
moes = [p,f,g,h,k,L]; % (Nx6) [L,-,-,-,-,rad]

end % function coes2moes