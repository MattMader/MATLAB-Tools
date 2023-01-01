function A_As = MAR(k,M)
% MAR - Mach to area relation computes the ratio of station area to sonic
%   area for isentropic flow given ratio of specific heats and station Mach
%   number
%
% Inputs:
%   k - Ratio of specific heats (Cp/Cv), must be larger than 1
%   M - Station Mach number
%
% Outputs:
%   A_As - Ratio of station area to sonic area
%
% Notes:
%   Author: Mattthew Mader
%   Contact: matthewjmader@gmail.com
%

% helpers
kp1 = k+1; % (k + 1)
km1 = k-1; % (k - 1)
expon = kp1/2/km1; % (k + 1) / (2(k - 1))

% computation
A_As = (kp1/2)^-expon * 1/M*(1+km1/2*M^2)^expon;

end % function