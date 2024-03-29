%% 6.1
v1 = [1, 1, 3];
v2 = [2, 2, 2];
v3 = [3, 6, 4];

A = [v1; v2; v3];

% No es una matriz simetrica y no es estricatamente diagonalmente dominante
[L,U, P] = lu(A)
Ai = L*U
%%Por tanto la reconstriccion necesita pivoteo
%% 6.2
im = imread('./Images/barbara.png'); 
im = im2double(im);

[L,U,P] = lu(im);

subplot(1,3,1);
imshow(im);
subplot(1,3,2);
imshow(L*U);
subplot(1,3,3);
imshow(inv(P)*L*U);

%% 6.3
v1 = [2, 0, 1, 1];
v2 = [-2, 4, 0, 1];
v3 = [-1, -1, 3, 1];
v4 = [0, 3, -1, 4];
b = [4, 3, 2, 6]';

A = [v1; v2; v3; v4];

% Es estrictamente diagonalmente dominante por filas por tanto jacobi
% converge
rowSum = sum(A,1)';%
dia    = diag(A);
isDiagonallyDominantByRow = all(rowSum < 2 * dia)

D = diag(diag(A))
B = inv(D)*(D - A)
radioSpectral = max(eig(B))

% Converge porque el radio espectral es disitionto de 0
tic
[x, iter] = itermeth(A, b, [0,0,0,0]',100, 10^-12,'J')
toc
error = norm(b - A * x)

tic
[L,U] = lu(A);
y =inv(L)*b;
result = inv(U)*y
toc

%% 6.4
%  |alpha| >= 2

%% 6.5
v1 = [-10, 2];
v2 = [-25, 5];

A = [v1; v2];
rank(A)

%% 6.6
v1 = [1, 1, 0];
v2 = [1, 6, 2];
v3 = [0, 2, 1];
b = [2, 9, 3]';

A = [v1; v2; v3];

isStrictillyDiagonallyDominantByRow = isSDDBR(A)
% No es DDPF
eig(A)
% Definida positiva por tanto converge gausidel

D = diag(diag(A))
B = inv(D)*(D - A)
radioSpectral = max(eig(B))
% Jacobi converge por que radio espectral menor que 1

tic
[x, iter] = itermeth(A, b, [0,0,0]',100, 10^-12,'J')
toc
error = norm(b - A * x)

tic
[x, iter] = itermeth(A, b, [0,0,0]',100, 10^-12,'G')
toc
error = norm(b - A * x)

%% 6.7
n=10
A=3*eye(n)-2*diag(ones(n-1,1),1)-diag(ones(n-1,1),-1)
b=ones(10,1);

%Jacobi
D = diag(diag(A))
B = inv(D)*(D - A)
radioSpectral = max(eig(B))
%Converge

%Gausaidel
E = -(tril(A)- D)
B = inv(D-E)*(D-E-A);
radioSpectral = max(eig(B))

tic
[x, iter] = itermeth(A, b, zeros(10,1),1000, 10^-12,'J')
toc
error = norm(b - A * x)

tic
[x, iter] = itermeth(A, b, zeros(10,1),1000, 10^-12,'G')
toc
error = norm(b - A * x)

tic
[x, iter] = itermeth_rel(A, b, zeros(10,1),1000, 10^-12,'G',1.5)
toc
error = norm(b - A * x)

%% 6.8
A = hilb(16);
x = ones(size(A, 2),1)
b = A*x;

eigVal = eig(A);
cond = norm(max(eigVal))/norm(min(eigVal))
%Slash
A \ b

%Jacobi
D = diag(diag(A))
B = inv(D)*(D - A)
radioSpectral = max(eig(B))

[x, iter] = itermeth(A, b, zeros(16,1),1000, 10^-12,'J')

%Gauss-seidel
E = -(tril(A)- D)
B = inv(D-E)*(D-E-A);
radioSpectral = max(eig(B))

[x, iter] = itermeth(A, b, zeros(16,1),1000, 10^-12,'G')

%Gauss-seidel relajado
[x, iter] = itermeth_rel(A, b, zeros(16,1),1000, 10^-12,'G',1.9)
error = norm(b - A * x)
%Como converge interesa sobrerelajarlo para hayar antes la solucion

%Gradiente
[x, iter] = itermeth(A, b, zeros(16,1),1000, 10^-12)
error = norm(b - A * x)

%Gradiente precondicionado con jacobi
D = diag(diag(A))
B = inv(D)*(D - A)
[x, iter] = itermeth(A, b, zeros(16,1),1000, 10^-12, B)
error = norm(b - A * x)

%Gradiente conjugado
[x,flag,relres,iter] = pcg(A,b)
error = norm(b - A * x)

%Gradiente conjugado predcondicionado chol
CHOL = chol(A)
[x,flag,relres,iter] = pcg(A,b,1e-8,100,CHOL,CHOL')
error = norm(b - A * x)

%Gradiente conjugado predcondicionado ichol
%Gradiente conjugado predcondicionado imodifiedchol

%GMRES
[x,flag,relres,iter] = gmres(A,b)