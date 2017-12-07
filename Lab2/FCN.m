function [Fn,DFn]=FCN(xn)
%Computes values of F(xn),F'(xn) for newton rootfinder using previous xn
x=xn;
Fn=x.^2-3;
DFn=2.*x;
end

