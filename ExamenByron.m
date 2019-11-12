%%Ejercicio 1
A = [2, 0, 1;
    1, 3, -1]

rank(A)

if rank(A) == size(A, 2)
    disp("Linearlly independent");
else
    disp("Linearlly dependent");
end

null(A)

rank(orth(A))
rank([orth(A),[18;-18]])



%% Ejercicio 2
%P = A' * A
%q = -A' * b
% r = energia b / 2

clear all
close all
clc

%% Apartado 1
syms x y z alpha

f = 2*x.^2 + 2*x*z + x + (1/2)*y.^2 + y*z + z.^2 -z -2;


 
A = [-1 1 1;
      1 1 0];
b = [1; -1];

fx = diff(f,x)
fy = diff(f,y)
fz = diff(f,z)

% double(hessian(f))
P = [4 0 2;
     0 1 1;
     2 1 2]

% Termino indepoendiente de  fx,fy,fz
q = [1; 0; -1]

r = -2

D = eig(P);

% Forma estandar dado que no tiene desigualdades
disp('Forma cuadratica en forma estandar, con restricciones de igualdad')

%% Apartado 2
[m,n] = size(A);
rangoA = rank(A);
rangoAB = rank([A b]);

disp('Por el Teorema de Rouche-Frobenius')
if (rangoA == rangoAB) && (rangoA < n)
    disp('Rango de A == Rango de [A b] y Rango de A es menor que n. Sistema compatible indeterminado y las soluciones son infinitas')
elseif  (rangoA == rangoAB) && (rangoA == n)
    disp('Rango de A == Rango de [A b] y Rango de A es igual que n. Sistema compatible determinado y la solucion es unica')
else
    disp('Rango de A es distinto al Rango de  [A b]. El sistema incompatible no tiene solucion')
end

X0 = [0 0 0]';
options = optimoptions('quadprog', 'Algorithm', 'interior-point-convex', 'Display', 'off');
[xq, fval, exitflag, output, lambda] = quadprog(P,q,[],[],A,b,[],[],X0,options);
xq
disp('Optimo del problema dual')
d_as = fval

b_as = A*xq;
% Si se verifica que Ax = b, la restriccion se cumple
if (isequal(floor(b_as),floor(b)))
    disp('Se verifica que Ax = b, luego la restriccion se cumple')
else
    disp('Ax /= b, luego la restriccion NO se cumple')
end

disp('Optimo del problema primal')
p_as = d_as + r

%% Apartado 3
Z =zeros(m);
KKT = [P A'; A Z];
if (det(KKT) ~= 0)
    disp('La matriz es invertible')
else
    disp('La matriz no es invertible')
end

bb = [-q; b];

sol = KKT\bb;
xp = sol(1:n);
p = (1/2)*xp'*P*xp +q'*xp+r
v_as = sol((n+1):end)
d = p - r