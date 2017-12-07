function [U]=PDE(U,J,M,dt,dx,F)
 %Updates Ui for each time value
 
for i=2:M+1
    U(i)=U(i)+dt/dx*(J(i-1)-J(i)+F(i-1));
end

end