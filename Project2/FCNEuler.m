function [xn]=FCNEuler(tn,xn,xs,dt)
%perform Euler scheme on IVP DE
m=1.e-3;
cs=7.52e-7;
ga=4.e-3;
cn=1.05*cs;
k=5.e7;
nn=1;
q=0;
j=length(xs);
if j == 1
    cT=cn+m.*xs.^3 - m.*xn.^3;
else
for nn=1:j
q=q+m.*xs(nn).^3 - m.*xn(nn).^3;
nn=nn+1;
end
cT=cn+q;
end
cL=cs.*exp(ga./xn);
g=1;
d=1;
if cT>cL
    f=k.*(cT-cL).^g;
else
    f=-k.*(cL-cT).^d;
end
xn=xn+dt*f;
