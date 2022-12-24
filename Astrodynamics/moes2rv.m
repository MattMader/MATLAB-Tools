function [r,v] = moes2rv(moes,mu)
% MOES2RV Converts modified orbital elements to cartesian position and
% velocity vectors. Vectorized to work with N-dimensional vectors.
% Everything in ECI Equitorial coordinates.
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
%   mu : standard gravitational parameter [L^3/T^2]
%
%
% Outputs:
%   r: position vector [L]
%
%   v: velocity vector [L/T]
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

% dimension
N = size(moes,1);

% initialize output
r = zeros(N,3);
v = zeros(N,3);

% unpack moes
p = moes(:,1);
f = moes(:,2);
g = moes(:,3);
h = moes(:,4);
k = moes(:,5);
L = moes(:,6);

% intermediary terms
q = 1 + f.*cos(L) + g.*sin(L);
R = p./q;
alpha2 = h.^2 - k.^2;
s2 = 1 + h.^2 + k.^2;

% compute position
r(:,1) = R./s2.*(cos(L) + alpha2.*cos(L) + 2*h.*k.*sin(L));
r(:,2) = R./s2.*(sin(L) - alpha2.*sin(L) + 2*h.*k.*cos(L));
r(:,3) = 2*R./s2.*(h.*sin(L) - k.*cos(L));

% compute velocity
v(:,1) = -1./s2.*sqrt(mu./p).*(sin(L) + alpha2.*sin(L) - 2*h.*k.*cos(L) + g - 2*f.*h.*k + alpha2.*g);
v(:,2) = -1./s2.*sqrt(mu./p).*(-cos(L) + alpha2.*cos(L) + 2*h.*k.*sin(L) - f + 2*g.*h.*k + alpha2.*f);
v(:,3) = 2./s2.*sqrt(mu./p).*(h.*cos(L) + k.*sin(L) + f.*h + g.*k);

end % function moes2rv