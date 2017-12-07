%%Nicole Nutter
%%Lab 2
% Newton rootfinder main program
% Goal: solve F(x)=0
%initial guess
x0=1;
%maximum number of iterations performed
maxIT=10;
%tolerance for testing convergence
TOL=1*exp(1)^-6;
%call rootfinder
Newton1D(x0,TOL,maxIT)



