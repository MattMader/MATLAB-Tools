function [lambda,theta] = CRPtoPRP(rho)
% CRPtoPRP computes the principal rotation parameters from the classical
%   Rodrigues parameters
%
% Inputs:
%   rho: Classical Rotrigues parameter (3x1) [-]
%
% Outputs:
%   theta: principal rotation angle (1x1) [rad]
%   lambda: principal rotation axis (3x1) [-]
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 21 Feb 2022
%
% Notes:
%

% compute DCM from CRP
C = CRPtoDCM(rho);

% compute PRP from DCM
[theta,lambda] = DCMtoPRP(C);

end