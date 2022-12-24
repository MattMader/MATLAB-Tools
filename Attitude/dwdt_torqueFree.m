function omega_dot = dwdt_torqueFree(omega,P1,P2,P3)
% dwdt_torqueFree Computes kinematic body rotational rates aligned with
%   principal moments of inertia in a torque-free environment.
%
% Inputs:
%   omega: Rotational rates in body frame (3x1) [rad/s]
%   P1,P2,P3: Principal moments of inertia [M*L^2]
%
% Outputs:
%   omega_dot: Rotational acceleration in body frame (3x1) [rad/s^2]
%
% Notes:
%   

omega_dot = [-(P3 - P2)/P1*omega(2)*omega(3)
    -(P1 - P3)/P2*omega(3)*omega(1)
    -(P2 - P1)/P3*omega(1)*omega(2)];

end