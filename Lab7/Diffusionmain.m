%%Nicole Nutter
%%Lab 7
%%Diffusion Numerical Scheme

%read in initial data
dat

%call for the length array
[M,x,dx] = XMSH(a,b,MM);

%set timestep
dtexpl=1/(abs(V)/dx+(2*D)/dx^2);  %normal timestep
dt=factor*dtexpl;    %factor<1 increases stability

%initialize numerical scheme
[U]=INIT(M);
nsteps=0;
time=0.0;
tout=max(dt,dtout);

%start of time stepping
for nsteps=1:Nmax
    time=time+dt;
    [J,U,F]=FLUX(U,x,M,b,D,time,V);
    [U]=PDE(U,J,M,dt,dx,F);
    if time>=tout
        [fid]=OUTPUT(time,nsteps,U,x,M);
        tout=tout+dtout;
    end
    if time>=tend
             fclose(fid);
        
        %print final
        fprintf('Done at t=%d, nsteps=%d\n',time,nsteps);
        
        return
    end
end
if nsteps == Nmax
    fprintf('Out of timesteps! Need bigger Nmax!')
end