function [U]=INITIAL(M,x)
%Initialize U and set boundary values
U=zeros(1,M+2);
for nn=1:length(U)
if x(nn)>=1 & x(nn)<=2
    U=5;
end
end
end

