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

%% 9.13
A=[ 1 1 1;
1 1 0]
n = size(A,2);
p = size(A,1);
P=2*eye(n);
Z=zeros(p);
M=[P A'; A Z]
bb=[0 0 0 2 2]';
sol=M\bb
xp=sol(1:n)
nud=sol(n+1:end)
A=[];B=[];
H=P;
f=[]; lb=[]; ub=[];
Aeq=[ 1 1 1;
1 1 0];
Beq=[2 2]';
X0=[0 0 0]';
options = optimoptions('quadprog','Algorithm','interior-point-convex','Display','off');
[X,fval,exitflag,output,lambda] = quadprog(H,f,A,B,Aeq,Beq,lb,ub,X0,options)
lambda.eqlin

%% 9.14
A = [1, 2; 0, 0];
n = size(A,2);
p = size(A,1);
P=2*eye(n);
Z=zeros(p);
M=[P A'; A Z]

A=[];B=[];
H=P;
f=[]; lb=[]; ub=[];
Aeq=[ 1, 2; 0, 0];
Beq=[1, 0]';
X0=[0, 0]';
options = optimoptions('quadprog','Algorithm','interior-point-convex','Display','off');
[X,fval,exitflag,output,lambda] = quadprog(H,f,A,B,Aeq,Beq,lb,ub,X0,options)
lambda.eqlin

%% 9.15
f = [-2; -6];
A = [1 1; -1 2; 2 1];
b = [2; 2; 3];
n = size(A,2);
p = size(A,1);
P=2*eye(n);
Z=zeros(p);
M=[P A'; A Z]

H=P;
%H = [1 -1; -1 2]; 

[X,fval,exitflag,output,lambda] = quadprog(H,f,A,b)
lambda.eqlin

%% 9.16
syms x y
ff = (1/2)*x^2+3*x+4*y
f = [3; 4];
A = [-1 -3; 3 4];
b = [-15; 80];

H= double(hessian(ff)); 

lb=[0, 0];
Aeq=[];
Beq=[];
%options = optimoptions('quadprog','Algorithm','interior-point-convex','Display','off');
[X,fval,exitflag,output,lambda] = quadprog(H,f,A,b,Aeq,Beq,lb)
%lambda.eqlin


%% Sergio
clear all
close all
clc
syms x y
f = (1/2)*x.^2 + 3*x + 4*y;
fx = diff(f,x);
fy = diff(f,y);
fxx = diff(fx,x);
fxy = diff(fx,y);
fyx = diff(fy,x);
fyy = diff(fy,y);
H = double([fxx fxy; fyx fyy])
d = [3; 4];
lb=[0, 0];
Aeq=[];
Beq=[];
%los valores linealmente independientes, los que se quedan sueltos al derivar
A = [ -1 -3; 3  4];
B = [-15; 80];
options = optimoptions('quadprog', 'Algorithm', 'interior-point-convex', 'Display', 'off');
[xq, fval, exitflag, output, lambda] = quadprog(H,d,A,B,Aeq,Beq,lb);
xq
fval
%% 
function f = myfun(x)
    f = -x(1) * x(2) * x(3);
return;
end



