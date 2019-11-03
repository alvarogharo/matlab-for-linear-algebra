%% Exercise 2.1
v1 = [1, 1, 0];
v2 = [0, 1, 1];
v3 = [-1, 2, 1];

mat = [v1; v2; v3];
if rank(mat) == size(mat, 2)
    disp("Linearlly independent");
else
    disp("Linearlly dependent");
end

disp(rref(mat)); %% Lower upper reduction

%% Exercise 2.2
v1 = [4, -5, 7];
v2 = [2, -3, 4];
v3 = [1, 1, -2];
v4 = [2, -1, 1];

mat = [v1; v2; v3; v4];
disp("Maximum linearlly independent vectors " + rank(mat));

%% Exercise 2.3
v1 = [-1, 1, 0];
v2 = [0, 1, 1];

mat = [v1; v2];
disp("Sub-space dimension " + rank(mat));
disp("Generated space equation -a1 + 2*a2 +a3");

%% Exercise 2.4
v1 = [4, -5, 7];
v2 = [2, -4, 4];
v3 = [1, 1, -2];
v4 = [2, -1, 1];

mat = [v1; v2; v3; v4];
[r, basiccol] = rref(mat);
base = mat(basiccol, :);
disp(base);

%% Exercise 2.5
Bv = [1, 0; 1, 1];
Bn = [-1, 1; 0, 2];
u = [3, 7];

result = linsolve(Bv', u');
result2 = pinv(Bv') * u';
result3 = Bv' \ u';

p = inv(Bn) * Bv' * inv(Bv');
uinbaseBn = p * u';

%% Exercise 2.7
A = [1, -2, 0; 0, 0, 0; 2, -4, 0];

disp("Rank of A  = " + rank(A));
disp("Base of rank A  = ");
disp(orth(A));

disp("Kernel of A  = " + abs(size(A, 2) - rank(A)));
disp("Base of rank A  = ");
disp(null(A));

%% Exercise 2.9
im = imread('./Images/lena_bw.png'); 
im = im2double(im);

im2 = imread('./Images/cameraman.tif'); 
im2 = im2double(im2);

lambda = 1;
noise = rand(size(im));
noiseIm1 = im + lambda*noise;

lambda = 0.1;
noise = rand(size(im));
noiseIm2 = im + lambda*noise;

lambda = 0.01;
noise = rand(size(im));
noiseIm3 = im + lambda*noise;

norm1 = norm(im - noiseIm1, 'fro')
norm2 = norm(im - noiseIm2, 'fro')
norm3 = norm(im - noiseIm3, 'fro')

norm3 = norm(im - im2, 'fro')

subplot(2,3,1);
imshow(noiseIm1);
subplot(2,3,2);
imshow(noiseIm2);
subplot(2,3,3);
imshow(noiseIm3);
subplot(2,3,4);
imshow(im2);

%% Exercise 2.10
im = imread('./Images/cadiz2015.jpg'); 
im = im2double(im);
im = rgb2gray(im);

norm1 = norm(im, 1)
norm2 = norm(im, 2)
norm3 = norm(im, 'inf')
norm4 = norm(im, 'fro')

imSqrd = im.^2;
energy = 0.5*sum(imSqrd(:))
eneygy2 = 0.5*norm(im,2)^2
