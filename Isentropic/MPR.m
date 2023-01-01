function P_Pt = MPR(k,M)
% MPR - Mach to pressure relation computes the ratio of station pressure to
%   total (stagnation) pressure for isentropic flow given ratio of specific
%   heats and station Mach number
%
% Inputs:
%   k - Ratio of specific heats (Cp/Cv), must be larger than 1
%   M - Station Mach number
%
% Outputs:
%   P_Pt - Station to total pressure ratio
%
% Notes:
%   Author: Mattthew Mader
%   Contact: matthewjmader@gmail.com
%

% helpers
km1 = k-1; % (k - 1)
expon = -k/km1; % -k / (k - 1))

% computation
P_Pt = (1 + km1/2*M^2)^expon;

end % function