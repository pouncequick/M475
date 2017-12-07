%%Nicole Nutter
%%Lab 1
%%Warm up programming and plotting
%evaluate f(x)=a-bx**3 at equidistant points in [0,1]
%read in N, a, and b from file titled initial
T = dlmread('initial.txt');
a = T(:,1);
b = T(:,2);
N = sum(T(:,3));
%evaluate f(x)=a-bx**3 at equidistant points in [0,1] where N is the number
%of points
x = [0:1/N:1];
y= [x; a - b.*x.^3];
%export values to text file titled values
fid = fopen('values.txt');
fprintf(fid,'%6.2f  %12.2f\n',x,y);
fclose(fid);
