%% Ejemplo 9.3
v1 = [-1, -2, -2];
v2 = [1, 2, 2];
b = [0, 72]';

A = [v1; v2];

x0 = [10; 10; 10]; % semilla inicial
[x,fval] = fmincon(@myfun,x0,A,b)

%% 9.4
c=[-150;-175];
A=[7 11;10 8];
b=[77;80];
Aeq=[0 0;0 0];
beq=[0;0];
LB=[0;0];
UB=[9;6];
[x,fval,exitflag,output,lambda]=linprog(c,A,b,Aeq,beq,LB,UB)

%% 9.5
c = [-1, -2];
A = [2, 1; 1, 1; -1, 1; -2, 1];
b = [10; 6; 2; 1];
Aeq = zeros(4,2);
beq = zeros(4,1);
LB = [0,0];
[x,fval,exitflag,output,lambda]=linprog(c,A,b,Aeq,beq,LB)

%% 9.7
c = [-1, -1/3];
A = [1, 1; 1, 1/4; 1, -1; -1/4, -1; -1, -1; -1, 1];
b = [2; 1; 2; 1; -1; 2];
Aeq = zeros(6,2);
beq = zeros(6,1);
LB = [0,0];
[x,fval,exitflag,output,lambda]=linprog(c,A,b,Aeq,beq)

%% 9.8
c = [-1, -1/3];
A = [1, 1; 1, 1/4; 1, -1; -1/4, -1; -1, -1; -1, 1];
b = [2; 1; 2; 1; -1; 2];
Aeq = [1, 1/4];
beq = [1/2];
LB = [0,0];
[x,fval,exitflag,output,lambda]=linprog(c,A,b,Aeq,beq,LB)

%% 9.9
c = [-1, -1/3];
A = [1, 1; 1, 1/4; 1, -1; -1/4, -1; -1, -1; -1, 1];
b = [2; 1; 2; 1; -1; 2];
Aeq = zeros(6,2);
beq = zeros(6,1);
LB = [-1,-3/2];
UB = [-1/2, 5/4];
[x,fval,exitflag,output,lambda]=linprog(c,A,b,Aeq,beq,LB,UB)

%% 9.10
c = [-4, -6];
A = [-1, 1; 1, 1; 2, 5];
b = [11; 27; 90];
Aeq = zeros(3,2);
beq = zeros(3,1);
LB = [0,0];
[x,fval,exitflag,output,lambda]=linprog(c,A,b,Aeq,beq,LB)

%% 9.11
c = [-2, 1, -2];
A = [2, 1, 0; 1, 2, -2; 0, 1, 2];
b = [10; 20; 5];
Aeq = zeros(3,3);
beq = zeros(3,1);
LB = [0,0,0];
[x,fval,exitflag,output,lambda]=linprog(c,A,b,Aeq,beq,LB)

%% 9.12
c = [-3, -2, -1];
A = [ 2, 3, 1; 1, 2, 3];
b = [60; 40];
Aeq = [4, 1, 1];
beq = [30];
LB = [0,0,0];
[x,fval,exitflag,output,lambda]=linprog(c,A,b,Aeq,beq,LB)

%% 
function f = myfun(x)
    f = -x(1) * x(2) * x(3);
return;
end


