param.m_axle_f      = 130; % mass on front axis
param.h_CG      = 0.300; % height of center of gravity
param.h_RC_f  = 0.06;  % height of front roll center
param.K_spring = 800;   % roll stiffness of spring Nm/rad
param.K_ARB    = 400;   % roll stiffness of ARB Nm/rad
param.K_total  = param.K_spring + param.K_ARB;


g_mag   = input("g magnitude:");
acc_dir = input("acceleration direction (0-360, 0 is front, 90 is left):");

function [M_roll, A_roll] = rollMotion(param, g_mag, acc_dir)

g = 9.81;

m  = param.m_axle_f;
hC = param.h_CG;
hRf = param.h_RC_f;
Kt = param.K_total;

a  = g_mag * g;
ay = a * sind(acc_dir);

M_roll = m * ay * (hC - hRf);
A_roll = M_roll / Kt;

end

[M_roll, A_roll] = rollMotion(param, g_mag, acc_dir);

display("Roll Moment (Nm):"+ M_roll)
display("Roll Angle (rad):"+ A_roll)
