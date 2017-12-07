function [fid]=OUTPUT(time,nsteps,ERR,U,x,uEXACT,M)
%Outputs profile to file
fid = fopen('prof.txt','w')
fprintf('Profile at this time %d, nsteps=%d\n',time,nsteps)
fprintf('Error up to this point=%d\n',ERR)
for i=1:M+2
fprintf(fid,'%6.2f  %12.2f %16.2f\n',x(i),U(i),uEXACT(i));
end

end