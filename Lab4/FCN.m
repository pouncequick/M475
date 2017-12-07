function [Fn,DFn]=FCN(xn)
%Computes values of F(xn),F'(xn) for newton rootfinder using previous xn
m=1.e-5;
cs=7.52e-7;
g=4.e-3;
cn=1.05*cs;
xs=0.08;
c1=cn+m*xs^3;
% mu*x^3 + (c*)*exp( gamma/x ) = c1 where   c1 = c0 + ?*(x*)^3
Fn=m.*xn.^3+cs.*exp(g./xn)-c1;
%  3*mu*x^2 + (c*)*-gamma/x^2*exp( gamma/x ) = c1
DFn=3*m.*xn.^2-cs*g*exp(g./xn)./(xn.^2);
end

