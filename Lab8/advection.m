%advection

%define variables
a = 0;      %minimum value of x
b = 7;      %maximum value of x
MM = 16;       %no. nodes -1
t = 0;         %time
tmax = 4;    %maximum value of t
v = 1;         %velocity

%create mesh
M=(b-a)*MM;
dx=1/MM;
x=zeros(1,M+2);
x(1) = a;
x(2) = a+dx/2;
for i=3:M+1
   x(i)=x(2)+(i-2)*dx;
end

x(M+2)=b;

%timestep
dt = abs(v)/dx;    %timestep

%set initial conditions
u0 = zeros(1,M+2);

for nn = 1:length(x)
if x(nn) >= 1 & x(nn) <= 2
    u0(nn) = 5;
end
nn = nn+1;
end
u = u0;
unp1 = u0;

%loop through time
nsteps = tmax/dt;
for n = 1 : nsteps
    
  
    %calculate the FOU scheme
    for i = 2 : M + 1
        unp1(i) = u(i) - v*dt/dx*(u(i)-u(i-1));
    end
    
    %update t and u
    t = t+dt;
    u = unp1;
    
    
    %plot solution
    plot(x,u,'bo-','markerfacecolor','b')
    pause(dt)
    
end