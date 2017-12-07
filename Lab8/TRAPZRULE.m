function [trps]=TRAPZRULE(U,dx,M)
%Compute the area
s=0;

for ii=2:M
s = s + U(ii);
end

trps = dx * s;

end
