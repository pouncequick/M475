function [Yn,ERRn,ERRmax]=FCN(tn,Yn,dt,ERRmax)
%perform Euler scheme on IVP DE
%f=2*tn;
f=Yn;
Yn=Yn+dt*f;
%Yext=tn*tn+1;
Yext=exp(tn);
ERRn=abs(Yn-Yext);
ERRmax=max([ERRn,ERRmax]);