function [Yn1,Yn2,ERRn,ERRmax]=FCN(tn,Yn1,Yn2,dt,ERRmax)
%perform Euler scheme on system of IVP DE
f1=Yn1;
f2=Yn2;
Yn1=Yn1+dt*f2;
Y1ext=cosh(tn);
Yn2=Yn2+dt*f1;
Y2ext=sinh(tn);
ERRn=abs(Yn1-Y1ext);
ERRmax=max([ERRn,ERRmax]);