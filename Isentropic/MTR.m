function T_Tt = MTR(k,M)
% MPR - Mach to temperature relation computes the ratio of station pressure
%   to total (stagnation) temperature ratio for isentropic flow given ratio
%   of specific heats and station Mach number
%
% Inputs:
%   k - Ratio of specific heats (Cp/Cv), must be larger than 1
%   M - Station Mach number
%
% Outputs:
%   T_Tt - Station to total temperature ratio
%
% Notes:
%   Author: Mattthew Mader
%   Contact: matthewjmader@gmail.com
%

% helpers
km1 = k-1; % (k - 1)

% computation
T_Tt = (1 + km1/2*M^2)^-1;

end % function