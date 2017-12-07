%Nicole Nutter
%Lab 6
%Euler scheme, main function
t0=0;
y0=1;
tend=1;
Nsteps=10;
dt=(tend-t0)/Nsteps;
Yn=y0;
tn=t0;
ERRn=0;
ERRmax=0;
%fprintf('n   tn   Yn   ERRn\n')
for n=1:Nsteps
   [Yn,ERRn,ERRmax]=FCN(tn,Yn,dt,ERRmax);
   %fprintf('%d   %d   %d   %d\n',n,tn,Yn,ERRn)
   tn=t0+n*dt;
end
ERRmax
