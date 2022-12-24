function moes = rv2moes(r,v,mu)
% RV2MOES Converts caresian position and velocity vectors to modified
% orbital elements. Vectorized to work with N-dimensional vectors.
% Everything in ECI Equitorial coordinates.
%
%
% Inputs:
%   r: cartesian position vector (Nx3) [L]
%
%   v: cartesian velocity vector (Nx3) [L/T]
%
%   mu: standard gravitational parameter of central body (1x1) [L^3/T^2]
%
%
% Ouputs:
%   moes(:,1) = p: semilatus rectum [L]
%   moes(:,2) = f: x eccentricity vector (orbital frame) [-]
%   moes(:,3) = g: y eccentricity vector (orbital frame) [-]
%   moes(:,4) = h: x node vector (orbital frame) [-]
%   moes(:,5) = k: y node vector (orbital frame) [-]
%   moes(:,6) = L: true longitude [rad]
%
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 13 Mar 2022
%
%
% Notes:
%   https://degenerateconic.com/modified-equinoctial-elements.html

% MATLAB implementation of Fortran subroutine
rdv = dot(r,v,2);

rmag = vecnorm(r,2,2);

rhat = r./rmag;

hvec = cross(r,v,2);

hmag = vecnorm(hvec,2,2);

hhat = hvec./hmag;

vhat = (rmag.*v - rdv.*rhat)./hmag;

p = hmag.*hmag/mu;

k = hhat(:,1)./(1 + hhat(:,3));

h = -hhat(:,2)./(1 + hhat(:,3));


kk = k.*k;

hh = h.*h;

s2 = 1 + hh + kk;

tkh = 2*k.*h;

ecc = cross(v,hvec,2)/mu - rhat;

fhat(:,1) = 1 - kk + hh;
fhat(:,2) = tkh;
fhat(:,3) = -2*k;

ghat(:,1) = tkh;
ghat(:,2) = 1 + kk - hh;
ghat(:,3) = 2*h;

fhat = fhat./s2;

ghat = ghat./s2;

f = dot(ecc,fhat,2);

g = dot(ecc,ghat,2);

L = atan2(rhat(:,2) - vhat(:,1), rhat(:,1) + vhat(:,2));

% constrain moes
L = mod(L,2*pi); % (Nx1) [rad]

moes = [p,f,g,h,k,L];

end % function rv2moes