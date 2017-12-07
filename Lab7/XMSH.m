function [M,x,dx] = XMSH(a,b,MM)
%Creates a mesh for length of object diffusing over
M=(b-a)*MM;
dx=1/MM;
x=zeros(1,M+2);
x(1) = a;
x(2) = a+dx/2;
for i=3:M+1
   x(i)=x(2)+(i-2)*dx;
end

x(M+2)=b;