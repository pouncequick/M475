function y=f(x)
m=1.e-3;
cs=7.52e-7;
ga=4.e-3;
cn=1.05*cs;
y=m.*x.^3+cs.*exp(ga./x)-(cn+m*(11)^3);