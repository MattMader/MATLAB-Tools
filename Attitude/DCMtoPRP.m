function [theta,lambda] = DCMtoPRP(C)
% DCMtoPRP computes the principal rotation parameters from a DCM
%
% Inputs:
%   C: Direction cosine matrix (3x3) [-]
%
% Outputs:
%   theta: principal rotation angle (1x1) [rad]
%   lambda: principal rotation axis (3x1) [-]
%
% Information:
%   Author: Matthew Mader
%   Contact: maderm@purdue.edu
%   Date: 21 Feb 2022
%
% Notes:
%

arguments

    C (3,3) {mustBeReal}

end % arguments

% principal rotation, over interval of [0,pi]
theta = acos(0.5*(C(1,1) + C(2,2) + C(3,3) - 1)); % (1x1) [rad]

% principal axis
lambda = 1/(2*sin(theta))*...
    [C(2,3)-C(3,2),C(3,1)-C(1,3),C(1,2)-C(2,1)]'; % (3x1) [-]


end % DCMtoPRP