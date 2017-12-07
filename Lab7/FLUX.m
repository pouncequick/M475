function [J,U]=FLUX(U,x,M,b,D,time)
%[J,U,F]=FLUX(U,x,M,b,D,time,V)
%Initialize flux over the body for time stepping
%J is diffusion flux, F is advection flux, D is diffusivity,
%M is the size of the mesh, U is the 
J=zeros(1,M+1);
U(1)=1;
U(M+2)=1-erf(0.5*b/sqrt(D*time));

for i=2:M+2
    J(i-1) = -D*(U(i)-U(i-1))/(x(i)-x(i-1));
end
end