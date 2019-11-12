%% Ejercicio 5.1.
%Sea dada la matriz A y el vector b = [1, 0, 2, 4]′. Clasiﬁcar el sistema asociado Ax = b en
%indeterminado o sobreterminado y discutir la existencia y unicidad de soluciones
%mediante el Teorema de Rouche-Frobenius. Calcular una soluci´on de m´ınimos
%cuadrados. ¿Es tambi´en soluci´on del sistema ? es unica ?
clear, close all, clc
format short
A = [2 -1;0 1;1 0;-1 2]
b = [1, 0, 2, 4]'
A_ampliada = [A,b]
if rank(A) == rank (A_ampliada)
    fprintf('El sistema Ax = b es compatible (admite solución) por el teorema de Frobenius \n ya que el rango de A es igual al de la ampliada (A|b)')
    if rank(A) == size(A,2)
        disp('Además es Determinado, existe una única solución')
    elseif rank(A) < size(A,2)
        disp('Además es Indeterminado, existen infinitas soluciones')
    end
else
    disp('El sistema es SOBREDETERMINADO. No existe solución ya que el rango de A es menor al de la ampliada (A|b)')
    fprintf("rank(A)= " + string(rank(A)) + " < " + string(rank(A_ampliada))+" rank(A|b)\n")
    disp('Se calcula una solución de mínimos cuadrados (Aproximación)')
    disp('Consiste en minimizar (optimizando) la norma del residuo=Ax-b')
end
if A'*A == (A'*A)'
    disp("A'*A es simétrica ya que la matriz y su traspuesta son iguales")
    if rank(A*A') == size(A,2)
        disp("A'A es definida positiva ya que su rango es máximo (igual al num de columnas de A)")
        disp('Luego el problema de mínimos cuadrados está bien planteado')
        % Calculo solucion minimos cuadrados
        [m,n] = size(A)
        [Q, R] = qr(A);                            % Factorizacion QR
        if (m>n)
            R_new = R(1:n,1:n);                     % Eliminando informacion redundante
            Q_new = Q(1:m,1:n);                     % Eliminando informacion redundante
            disp('Solución de minimos cuadrados:')
            x = R_new^(-1) * Q_new' * b             % Solucion de minimos cuadrados
        else
            disp('Solución de minimos cuadrados:')
            x = R^(-1) * Q' * b                     % Solucion de minimos cuadrados
        end
    else
        disp("A'A es semi-definida positiva ya que su rango no es máximo (menor al num de columnas de A)")
        disp('Luego el problema de mínimos cuadrados NO está bien planteado')
    end
end

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

% Se calcula el rango de la soluci�n de minimos cuadrados
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
% determinado y con ello, soluci�n �nica por tanto sistema bien planteado.
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
% determinado y con ello, soluci�n �nica por tanto sistema bien planteado.

xmc = gmres(Amc, bmc)

norm(A*xmc - b)

% Tambien es solucion del sistema original

%% 5.4 (Apuntes pagina 74)
    
%% 5.5
