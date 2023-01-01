function [Pt2_Pt1, M2] = NSR(k,M1)
% NSR - Normal shock relation compures total pressure (stagnation) ratio
%   across a normal shock and the downstream Mach given ratio of specific
%   heats and upstream Mach number
%
% Inputs:
%   k - Ratio of specific heats (Cp/Cv), must be larger than 1
%   M1 - Upstream Mach number
%
% Outputs:
%   Pt2_Pt1 - Downstream total pressure to upstream total pressure ratio
%   M2 - Downstream Mach number
%
% Notes:
%   Author: Mattthew Mader
%   Contact: matthewjmader@gmail.com
%

% helpers
kp1 = k + 1; % (k + 1)
km1 = k - 1; % (k - 1)

% Total pressure ratio
Pt2_Pt1 = (kp1*M1^2/(km1*M1^2 + 2))^(k/km1) * (kp1/(2*k*M1^2 - km1))^(1/km1);

% downstream Mach
M2 = sqrt( (km1*M1^2+2)/(2*k*M1^2-km1));

end % function