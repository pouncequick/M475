function [J,U,F]=FLUX(U,x,M,D,V,dt,dx)
%Initialize flux over the body for time stepping
J=zeros(1,M+1);
F=zeros(1,M+1);
U(1)=U(2);
U(M+2)=U(M+1);

for i=2:M+2
    J(i-1) = -D*(U(i)-U(i-1))/(x(i)-x(i-1));
    F(i-1) = V*U(i-1);
end
end