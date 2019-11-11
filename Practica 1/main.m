%% -----------------Fundamentos Matem�ticos - MOVA 2017----------------- %%
%                                Pr�ctica 3                               %
% I. Ramirez, E. Schiavi                                                  %
% URJC - Madrid 2018                                                      %
%%-----------------------------------------------------------------------%%
%
% En esta pr�ctica vamos a implementar un algoritmo de difusi�n lineal. 
% El objetivo es restaurar una imagen que ha sido deteriorada con ruido
% (denoising).

%% Cargar datos (im�genes)

im = imread('./Images/im4.jpg'); 
% Comprobamos el tipo de datos que tenemos (Workspace por ejemplo)
% im es una matriz 512x512 (1 solo canal) de tipo uint8 (enteros sin signo 
% de 8 bits) por tanto el rango de los valores es [0-255], 2^8 = 256 valores.
im = im2double(im);
% im2double transforma los datos en tipo double y en el rango [0,1].
% En general trabajaremos en este rango por simplicidad.

%% Deterioramos la imagen
Noise_STD   = 0.05; % desviaci�n t�pica del ruido AWGN
noise       = Noise_STD*randn(size(im));
im_blur     = im + noise;
%% Selecci�n de par�metros
close all
% Proporcionamos los par�metros para nuestro algoritmo
varin.lambda    = 0.5;      % hyperpar�metro de fidelidad
varin.Nit       = 500;      % n�mero de iteraciones del algoritmo
varin.dt        = 1e-2;     % tama�o del paso 
varin.epsilon   = 0;
varin.p         = 3;
varin.f         = im_blur;  % imagen ruidosa
varin.Verbose   = 2;        % Verbose
varin.im_org    = im;       % Imagen original para el c�mputo de la PSNR
% Los par�metros se agrupan en un struct por simplicidad

% Ejecutamos el algoritmo
[varout] = Denoising_Linear_Diffusion(varin);

% Mostramos el resultado
u = varout.u;

figure,
subplot(131), imshow(im),       title('Original')
subplot(132), imshow(varin.f),  title('Ruidosa')
subplot(133), imshow(u),        title('Restaurada')

PSNR(im,u)