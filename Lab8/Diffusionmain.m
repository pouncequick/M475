%%Nicole Nutter
%%Lab 8
%%Advection-Diffusion Numerical Scheme

%read in initial data
dat

%call for the length array
[M,x,dx] = XMSH(a,b,MM);

%set timestep
dtexpl=1/(abs(V)/dx+(2*D)/dx^2);  %normal timestep
dt=factor*dtexpl;    %factor<1 increases stability

%initialize numerical scheme
[U]=INITIAL(M,x);
nsteps=0;
time=0.0;
tout=max(dt,dtout);

%print initial state
[trps]=TRAPZRULE(U,dx,M);
fid = fopen('prof.txt','a');
fprintf('Profile at this time %d, nsteps=%d, area=%d\n',time,nsteps,trps);
for i=1:M+2
fprintf(fid,'%12.4f  %16.8g\n',x(i),U(i));
end
fprintf(fid,'\n');

%start of time stepping
for nsteps=1:Nmax
    time=time+dt;
    [J,U,F]=FLUX(U,x,M,D,V,dt,dx);
    [U]=PDEs(U,J,M,dt,dx,F);
    [trps]=TRAPZRULE(U,dx,M);
    if time>=tout
        [fid]=OUTPUT(time,nsteps,U,x,M,trps);
        tout=tout+dtout;
    end
    if time>=tend
            
        
        %print final
        fprintf('Done at t=%d, nsteps=%d\n',time,nsteps);
        
        return
    end
    
    %plot(x,U,'bo-')
    %pause(dt)
end
if nsteps == Nmax
    fprintf('Out of timesteps! Need bigger Nmax!')
end

 fid = fclose(fid);