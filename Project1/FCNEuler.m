function [xn]=FCNEuler(tn,xn,xs,dt)
%perform Euler scheme on IVP DE
m=1.e-3;
cs=7.52e-7;
ga=4.e-3;
cn=1.05*cs;
k=5.e7;
cT=cn+m*xs^3-m*xn^3;
cL=cs*exp(ga/xn);
g=1;
d=1;
if cT>cL
    f=k*(cT-cL)^g;
else
    f=-k*(cL-cT)^d;
end
xn=xn+dt*f;
