function [fid]=OUTPUT(time,nsteps,U,x,M,trps)
%Outputs profile to file
fid = fopen('prof.txt','a');
fprintf('Profile at this time %d, nsteps=%d, area=%d\n',time,nsteps,trps);

for i=1:M+2
fprintf(fid,'%12.4f  %16.8g\n',x(i),U(i));
end
fprintf(fid,'\n');
end
