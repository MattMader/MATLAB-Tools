function [vd1,va1,vd2,va2] = lambert(rd,ra,tof,mu)
% lambert.m Solves Lambert's targetting problem robustly.
%
% Inputs:
%   rd: Departure/initial position          (Nx3) [L]
%   ra: Arrival/final position              (Nx3) [L]
%   tof: Time of flight                     (Nx1) [T]
%   mu: Standard gravitational parameter    (1x1) [L^3/T^2]
%       Note: Units of mu must match given positions and time of flight
%
% Outputs:
%   vd1: Departure/initial velocity (solution 1)    (Nx3) [L/T]
%   va2: Arrival/final velocity (solution 1)        (Nx3) [L/T]
%   vd2: Departure/initial velocity (solution 2)    (Nx3) [L/T]
%   va2: Arrival/final velocity (solution 2)        (Nx3) [L/T]
%
% Notes:
%   https://github.com/rodyo/FEX-Lambert

% size of input
N = size(rd,1);

% initialize output
vd1 = zeros(N,3);
va1 = zeros(N,3);
vd2 = zeros(N,3);
va2 = zeros(N,3);

% loop over inputs
for n = 1:N
    [vd1(n,:),va1(n,:)] = lambert_comp_mex(rd(n,:),ra(n,:),tof(n),0,mu);
    [vd2(n,:),va2(n,:)] = lambert_comp_mex(rd(n,:),ra(n,:),-tof(n),0,mu);
end % for n

end % function lambert