%Nicole Nutter
%Euler scheme, main function
%Used to numerically determine growth of crystals in Ostwald Ripening
t0=0;
xs = [0.05,0.09];
tend = 0.1;
Nsteps = 10000;
dt = (tend-t0)/Nsteps;
xn = xs;
tn=t0;
fid = fopen('values.txt','w');
for n=1:Nsteps
   fprintf(fid,'%6.8f  %12.8f %18.8f\n',tn,xn(1),xn(2));
        [xn]=FCNEuler(tn,xn,xs,dt);
        tn=t0+n*dt;
     if xn(1)<=0
        break
        %xn(1)=0;
     end
end
fclose(fid);
xn
tn
