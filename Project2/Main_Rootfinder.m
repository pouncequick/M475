%%Nicole Nutter
%%Project 2
% Rootfinder for crystal growth
% Goal: Find the equilibria
%initial guess
x0=0.1;
%maximum number of iterations performed
maxIT=25;
%tolerance for testing convergence
TOL=1.e-16;
%call rootfinder
Newton1D(x0,TOL,maxIT)