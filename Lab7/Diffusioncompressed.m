%%Nicole Nutter
%%Lab 7
%%Diffusion Numerical Scheme
%%Removed subfunctions

%read in initial data
MM = 32 ;  tend=3. ;  dtout=1. ;  Nmax=1000; factor=0.98 ;  D = 0.1 ;  a=0.0 ; b=1.0;

%call for the length array
%Creates a mesh for length of object diffusing over
M=(b-a)*MM;
dx=1/MM;
x=zeros(1,M+2);
x(1)=a;
x(2)=a+dx/2;
for i=3:M
   x(i)=x(2)+(i-1)*dx;
end
x(M+1)=b;

%set timestep
dtexpl=dx*dx/(2*D);  %normal timestep
dt=factor*dtexpl;    %factor<1 increases stability

%initialize numerical scheme
U=zeros(1,M+1);
U(1)=1; U(M+1)=1-erf(0.5*b/sqrt(D));
nsteps=0;
time=0.0;

uEXACT(1)=1;
uEXACT(M+1)=1-erf(0.5*b/sqrt(D*time));
ERR=0.0;
for i=2:M
uEXACT(i)=1-erf(0.5*x(i)/sqrt(D*time));
ERRi=abs(U(i)-uEXACT(i));
ERR=max(ERRi,ERR);
end
%Open file and print initial
fid=fopen('prof.txt','w');
fprintf('Profile at this time %d, nsteps=%d\n',time,nsteps)

for i=1:M+1
fprintf(fid,'%6.2f  %12.2f %16.2f\n',x(i),U(i),uEXACT(i));
end
fprintf(fid,'\n')
%determine tout
tout=max(dt,dtout);

%start of time stepping
for nsteps=1:Nmax
    time=time+dt;
    J=zeros(1,M+1);
J(1)=a;
J(M+1)=b;
for i=2:M
    J(i)=-D*(U(i+1)-U(i))/(x(i+1)-x(i));
end
    %Updates Ui for each time value using Crank Nicolson
for i=2:M
    U(i)=U(i)+dt*D/(dx^2)*(U(i-1)-2*U(i)+U(i+1));
end
U(M+1)=1-erf(0.5*b/sqrt(D*time));
    if time>=tout
        %Compare with exact
        uEXACT=zeros(1,M+1);
uEXACT(1)=1;
uEXACT(M+1)=1-erf(0.5*b/sqrt(D*time));
ERR=0.0;
for i=2:M
uEXACT(i)=1-erf(0.5*x(i)/sqrt(D*time));
ERRi=abs(U(i)-uEXACT(i));
ERR=max(ERRi,ERR);
end
%Outputs profile to file
fprintf('Profile at this time %d, nsteps=%d\n',time,nsteps)
fprintf('Error up to this point=%d\n',ERR)
for i=1:M+1
fprintf(fid,'%6.2f  %12.2f %16.2f\n',x(i),U(i),uEXACT(i));
end
fprintf(fid,'\n')
        tout=tout+dtout;
    end
    if time>=tend
        %print end profile to file
        fprintf('Profile at this time %d, nsteps=%d\n',time,nsteps)
fprintf('Error up to this point=%d\n',ERR)
for i=1:M+1
fprintf(fid,'%6.2f  %12.2f %16.2f\n',x(i),U(i),uEXACT(i));
end
 fclose(fid);
        %print output
        fprintf('Done at t=%d, nsteps=%d\n',time,nsteps)
        fprintf('Max error=%d',ERR)
        break
    end
end
if nsteps == Nmax
    fprintf('Out of timesteps! Need bigger Nmax!')
end