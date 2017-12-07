%Lab 7
%Euler scheme for systems, main function
t0=0;
y10=1;
y20=0;
tend=1;
Nsteps=5000;
dt=(tend-t0)/Nsteps;
Yn1=y10;
Yn2=y20;
tn=t0;
ERRn=0;
ERRmax=0;
%fprintf('n   tn   Yn1   ERRn\n')
for n=1:Nsteps
   [Yn1,Yn2,ERRn,ERRmax]=FCN(tn,Yn1,Yn2,dt,ERRmax);
   %fprintf('%d   %d   %d   %d\n',n,tn,Yn1,ERRn)
   tn=t0+n*dt;
end
ERRmax