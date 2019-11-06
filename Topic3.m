%% Exercise 3.2
[x,y] = meshgrid(-2:.2:2);
z = -2*x.^2 +4*x*y+2*y.^2;
figure(1)
surf(x,y,z);
hold on;
surf(x,y,130);
hold off;
grid on;

%% Exercise 3.3
v1 = [1, 2, 2];
v2 = [-1, 4, 1];
v3 = [-2, 2, 5];

mat = [v1; v2; v3];

[V,D] = eig(mat, "multiple")

%% Exercise 3.4
v1 = [-2, -2, 3];
v2 = [-5, 1, 3];
v3 = [-6, 0, 5];

mat = [v1; v2; v3];

[V,D] = eig(mat);
if rank(mat) == size(mat, 1)
    disp("Diagonalizable matrix")
else
    disp("Non-diagonalizable matrix")
end

%% Exercise 3.5
v1 = [1, 1];
v2 = [0, 1];

mat = [v1; v2];
[V,D] = eig(mat)
[Vv,Dv] = eig(V)

%% Exercise 3.6
v1 = [-3, -2, 1];
v2 = [1, -6, 1];
v3 = [1, -2, -3];

mat = [v1; v2; v3];
[V,D] = eig(mat)
% No diagonalizable

v1 = [-4, -1, -1];
v2 = [-1, -5, 1];
v3 = [-1, 0, -3];

mat = [v1; v2; v3];
[V,D] = eig(mat)
% Diagonalizable

%% Exercise 3.7
v1 = [10, 2, 1];
v2 = [2, 1, 0];
v3 = [1, 0, 10];
u = [1, 0, 1];

mat = [v1; v2; v3];
if mat == mat'
    disp("Symetric matrix");
else
    disp("Non-symetric matrix");
end

[V,D] = eig(mat)

BASE = orth(mat)

cord = inv(BASE) * u' 

%% Exercise 3.8
mat = hilb(100)
surf(mat)
cond(mat)

%% Exercise 3.9
v1 = [2, 1];
v2 = [1, 5];

mat = [v1; v2];
if mat == mat'
    disp("Symetric matrix");
else
    disp("Non-symetric matrix");
end
[V,D] = eig(mat)
CHOL = chol(mat)
CHOL' * CHOL

v1 = [2, 1];
v2 = [1, 0];

mat = [v1; v2];
if mat == mat'
    disp("Symetric matrix");
else
    disp("Non-symetric matrix");
end
[V,D] = eig(mat)

%% 3.10
v1 = [-1, -1, 1];
v2 = [1, 3, 3];
v3 = [-1, -1, 5];
v4 = [1, 3, 7];

mat = [v1; v2; v3; v4];
[Q,R] = qr(mat)

RESISUE = mat - Q*R