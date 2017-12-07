function [r]=Newton1D(x0,TOL,maxIT)
xn = x0;
dx = 1000;
fprintf('#n xn F(xn)\n')
for n=1:maxIT
    [Fn,DFn]=FCN(xn);
    fprintf('%d %d %d\n',n,xn,Fn)
    if abs(dx)<TOL
        if abs(Fn)<TOL
        fprintf('DONE: root = %d and F = %d in %d iters\n',xn,Fn,n)
        break
    else 
        fprintf('STUCK!: dx<TOL BUT residual = %d > TOL\n',Fn)
        break
        end
    else
        dx = -Fn./DFn;
        xn = xn + dx;
    end
end
if n==maxIT
    fprintf('BAD: reached maxIT!\n')
end