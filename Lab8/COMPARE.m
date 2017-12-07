function [ERR, uEXACT]=COMPARE(U,time,D,M,x,b)
%Compares the numerical to the exact value
ERR=0.0;

%Start uEXAC
uEXACT=zeros(1,M+2);
uEXACT(1)=1;
uEXACT(M+2)=1-erf(0.5*b/sqrt(D*time));

for i=2:M+1
uEXACT(i)=1-erf(x(i)/(2*sqrt(D*time)));
ERRi=abs(U(i)-uEXACT(i));
ERR=max(ERRi,ERR);
end

end