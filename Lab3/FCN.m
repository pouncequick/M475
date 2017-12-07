function [Fn,DFn]=FCN(xn)
%Computes values of F(xn),F'(xn) for newton rootfinder using previous xn
x=xn;
%Lab 2: F(x) = x2 ? 3
%Lab 3: F(x) = x3 ? 1.2x2 ? 8.55x + 12.15
Fn=x.^3-1.2.*x.^2-8.55.*x+12.15;
DFn=3.*x.^2-2.4.*x-8.55;
end
