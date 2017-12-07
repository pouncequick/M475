function [Fn,DFn]=FCN(xn)
%Computes values of F(xn),F'(xn) for newton rootfinder using previous xn
m=1.e-3;
cs=7.52e-7;
ga=4.e-3;
xs=0.09;
cn=1.05*cs;
c1=cn+m*xs^3;
% mu*x^3 + (c*)*exp( gamma/x ) = c1 where   c1 = c0 + ?*(x*)^3
Fn=m.*xn.^3+cs.*exp(ga./xn)-c1;
%  3*mu*x^2 + (c*)*-gamma/x^2*exp( gamma/x ) = c1
DFn=3*m.*xn.^2-cs*ga*exp(ga./xn)./(xn.^2);
end

