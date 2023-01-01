function m_dot = mass_flow(k,R,A,Tt,Pt,M)
% MASS_FLOW - Computes the mass flow through the throat given the ratio of
%   specific heats, specific gas constant, area, total (stagnation)
%   temperature, total (stagnation) pressure, and Mach number (optional)
%
% Inputs:
%   k - Ratio of specific heats (Cp/Cv), must be larger than 1
%   R - Specific gas constant (R_universal/MW)
%   A - Cross sectional area
%   Tt - Total temperature
%   Pt - Total pressure
%   M - Mach number (less than or equal to one)
%
% Outputs:
%   m_dot - Mass flow rate
%
% Notes:
%   Author: Mattthew Mader
%   Contact: matthewjmader@gmail.com
%

% choked by default
if nargin == 5
    M = 1;
end

% helpers
kp1 = k+1; % (k + 1)
km1 = k-1; % (k - 1)
expon = -kp1/(2*km1); % -(k + 1) / ( 2*(k - 1) )

% computation
m_dot = A*Pt*sqrt(k/(Tt*R))*M*(1 + km1/2*M^2)^expon;