function M = PMR(k,P_Pt)
% PMR - Pressure to Mach relation computes the station Mach number given
%   ratio of specific heats and station pressure to total (stagnation)
%   pressure ratio
%
% Inputs:
%   k - Ratio of specific heats (Cp/Cv), must be larger than 1
%   P_Pt - Station to total pressure ratio
%
% Outputs:
%   M - Station Mach number
%
% Notes:
%   Author: Mattthew Mader
%   Contact: matthewjmader@gmail.com
%

% helpers
km1 = k-1; % (k - 1)
expon = -km1/k; % -(k - 1) / k

% computation
M = sqrt( 2/km1 * (P_Pt^expon - 1) );

end % function