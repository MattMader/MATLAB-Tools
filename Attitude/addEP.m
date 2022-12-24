function epsilon_CN = addEP(epsilon_NB, epsilon_BC)
% addEP computes the addition of Euler Parameters (EP) vectors from two EP
%   vectors.
%
% Inputs:
%   epsilon_NB: first EP vector (written wrt shared frame B)
%   epsilon_BC: second EP vector (written wrt shared frame B)
%
% Outputs:
%   epsilon_CN: ouput EP vector (written wrt initial frame N)
%
% Information:
%   Author: Matthew Mader
%   Contact: matthewjmader@gmail.com
%   Date: 21 Feb 2022
%
% Notes:
%

% conversion matrix
B = [epsilon_BC(4),epsilon_BC(3),-epsilon_BC(2),epsilon_BC(1);
    -epsilon_BC(3),epsilon_BC(4),epsilon_BC(1),epsilon_BC(2);
    epsilon_BC(2),-epsilon_BC(1),epsilon_BC(4),epsilon_BC(3);
    -epsilon_BC(1),-epsilon_BC(2),-epsilon_BC(3),epsilon_BC(4)];

% EP addition
epsilon_CN = B*epsilon_NB;

% if epsilon_CN(4) < 0
if epsilon_CN(4) < 0
    epsilon_CN = -epsilon_CN;
end % if

end % function addEP