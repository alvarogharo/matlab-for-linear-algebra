%% 5.1
v1 = [2, -1];
v2 = [0, 1];
v3 = [1, 0];
v4 = [-1, 2];
b = [1, 0, 2, 4]';

A = [v1; v2; v3; v4];

rank(A)
Aa = [A, b];
rank(Aa)

% Sistema sobre determinado
% Rank de A es 2 menor que rank de Aa que 3 por tanto no tiene soluciones

% Se calcula el rango de la solución de minimos cuadrados
rank(A'*A)
% Si el rango es maximo rank
if rank(A'*A) == min(size(A'*A)) 
    disp("A'*A es semi-definida positiva, podemos resolver minimos cuadrados");
    % Minimos cuadrados con slash (no seguro)
    x = A'*A \ A'*b
    
    %Gmres
    x = gmres(A'*A, A'*b)
    
    norm(A*x - b)
end;

%% 5.2
Q = magic(4);
q = [34, 34, 34, 34]';

rank(Q)
Qa = [Q, q];
rank(Qa)

% Rank Q es igual rank Q ampliada por tanto es compatible determinada

x = pinv(Q)*q

% Aproximado por ser metodo iterativo (creo)
x = Q \ q;

x = gmres(Q'*Q, Q'*q);

Q*x;

%% 5.3
v1 = [2, -1, 3, 0];
v2 = [0, 1, 0, 1];
v3 = [1, 0, -1, 2];
b = [1, 0, -1]';

A = [v1; v2; v3];

rank(A)
Aa = [A, b];
rank(Aa)

% Rango de A y ampliada son iguales portanto es un sistema compatible
% determinado y con ello, solución única por tanto sistema bien planteado.
x = pinv(A)*b
x = A \ b

% When the system A*x = b is overdetermined, both algorithms provide a 
% similar answer. When the system is underdetermined, PINV will return the 
%solution x, that has the minimum norm (min NORM(x)). MLDIVIDE will pick a 
%solution which has at most m nonzero components for an m-by-n matrix A.

Amc = A'*A;
bmc = A'*b;

rank(Amc)
Aamc = [Amc, bmc];
rank(Aamc)

% Rango de A y ampliada son iguales portanto es un sistema compatible
% determinado y con ello, solución única por tanto sistema bien planteado.

xmc = gmres(Amc, bmc)

norm(A*xmc - b)

% Tambien es solucion del sistema original

%% 5.4 (Apuntes pagina 74)

%% 5.5
