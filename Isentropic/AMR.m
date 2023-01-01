function M = AMR(k,A_As,type)
% AMR - Area to Mach relation computes the station Mach number for
%   isentropic flow given ratio of specific heats, station area to sonic
%   area ratio, and whether the flow is super or subsonic.
%
% Inputs:
%   k - Ratio of specific heats (Cp/Cv), must be larger than 1
%   A_As - Ratio of station area to sonic area
%   type - Type of flow 'sub' (subsonic) or 'sup' (supersonic)
%
% Outputs:
%   M - Station Mach number
%
% Notes:
%   Author: Mattthew Mader
%   Contact: matthewjmader@gmail.com
%

% sonic case
if A_As == 1
    M = 1;
    
% subsonic case
elseif strcmpi(type,'sub')
    
    % check for extreme cases
    if A_As >= MAR(k,1e-9)
        M = 0;
        return
    end

    % zero finding algorithm (assume M < 1e-9 => A_As ~0)
    M = fzero(@(M)(A_As - MAR(k,M)),[1e-9 1]);

% supersonic case
elseif strcmpi(type,'sup')

    % check for extreme case
    if A_As >= MAR(k,1e9)
        M = inf;
        return
    end

    % zero finding algorithm (assume Mach >1e9 => A_As ~infty)
    M = fzero(@(M)(A_As - MAR(k,M)),[1 1e9]);

end % if/elseif/elseif

end % function