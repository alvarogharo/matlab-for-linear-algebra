%% Exercise 1.1
im = imread('./Images/dali-bw.jpg'); 
im = im2double(im);
imshow(im);

%% Exercise 1.2
im = imread('./Images/BaboonRGB.tif'); 
im = im2double(im);
subplot(1,3,1);
imshow(im(:,:,1));
subplot(1,3,2);
imshow(im(:,:,2));
subplot(1,3,3);
imshow(im(:,:,3));

%% Exercise 1.3
im = imread('./Images/cameraman.tif'); 
im = im2double(im);

im2 = imread('./Images/baboonBW.tif'); 
im2 = im2double(im2);

alfa = 0.2;
beta = 1 - alfa;
imshow(alfa*im+beta*im2);

%% Exercise 1.4
im = imread('./Images/lena_bw.png'); 
im = im2double(im);

lambda = 0.15;
noise = rand(size(im));
noiseIm = im + lambda*noise;
imshow(noiseIm);

%% Exercise 1.5
a = [1, 2; 3, 4];
b = [2, 0; 1, -1];

rowcolProduct = a*b;
hadamardProduct = a.*b;

if rowcolProduct == hadamardProduct
    disp("Equal");
else
    disp("Not equal");
end

%% Exercise 1.6
u = [2, 1]';
v = [-1, 3];

dotProduct = dot(u, v);
CosTheta = dotProduct/(norm(u)*norm(v));
ThetaInDegrees = acosd(CosTheta);
disp("Dot product = " + dotProduct + " Degrees = " + ThetaInDegrees);

%% Exercise 1.7
u1 = [1, 2, 1];
u2 = [-1, 0, 0];
u3 = [0, 1, -2];

cross = cross(u2, u1);

