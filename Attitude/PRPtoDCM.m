function C = PRPtoDCM(theta,lambda)
% DCMtoPRP computes the principal rotation parameters from a DCM
%
% Inputs:
%   theta: principal rotation angle (1x1) [rad]
%   lambda: principal rotation axis (3x1) [-]
%
% Outputs:
%   C: Direction cosine matrix (3x3) [-]
%
% Information:
%   Author: Matthew Mader
%   Contact: maderm@purdue.edu
%   Date: 21 Feb 2022
%
% Notes:
%

arguments

    theta (1,1) {mustBeReal}
    lambda (3,1) {mustBeReal}

end % arguments

% initiate output
C = zeros(3,3); % (3x3) [-]

% DCM elements
C(1,1) = lambda(1)^2*(1-cos(theta))+cos(theta);
C(1,2) = lambda(1)*lambda(2)*(1-cos(theta))+lambda(3)*sin(theta);
C(1,3) = lambda(1)*lambda(3)*(1-cos(theta))-lambda(2)*sin(theta);
C(2,1) = lambda(1)*lambda(2)*(1-cos(theta))-lambda(3)*sin(theta);
C(2,2) = lambda(2)^2*(1-cos(theta))+cos(theta);
C(2,3) = lambda(2)*lambda(3)*(1-cos(theta))+lambda(1)*sin(theta);
C(3,1) = lambda(1)*lambda(3)*(1-cos(theta))+lambda(2)*sin(theta);
C(3,2) = lambda(2)*lambda(3)*(1-cos(theta))-lambda(1)*sin(theta);
C(3,3) = lambda(3)^2*(1-cos(theta))+cos(theta);

end % function PRPtoDCM