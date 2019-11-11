%% Aplicaciones
clear all;
close all;
IO=imread('./Images/dali-bw.jpg');
I = im2double(IO);
[m, n]=size(I);
hx=1;
hy=1;
% Calculo derivadas parciales en diferencias finitas
disp('Calculo derivadas parciales en diferencias finitas')
% primera derivada progresiva (i+1 - i)
I_x = [I(:,2:end)-I(:,1:end-1), zeros(m,1)]/hx;
I_y = [I(2:end,:)-I(1:end-1,:); zeros(1,n)]/hy;
% funcion gradient matlab
disp('Calculo derivadas parciales mediante gradient')
[fx,fy]=gradient(I);
% Calculo derivadas parciales implicitas 5 puntos
disp('Calculo derivadas parciales implicitas 5 puntos')
% derivadas implicitas 5 puntos
[gx5, gy5] = derivative5(I, 'x', 'y');
% Calculo derivadas parciales implicitas 7 puntos
disp('Calculo derivadas parciales implicitas 7 puntos')
[gx7, gy7] = derivative7(I, 'x', 'y');
% magnitud gradiente
disp('Calculo del M´odulo del Gradiente')
mag_gradiente = sqrt((gx7).^2 + (gy7).^2);
% orientacion gradiente
th = atan2(-gy7,gx7); % ´angulos de -pi a + pi.
th(th<0) = th(th<0)+pi; % Mapea ´angulos a 0-pi.
th = th*180/pi;
% c´alculo derivadas segundas y operador de Laplace
disp('Calculo derivadas segundas')
I_xx=[zeros(m,1), -I_x(:,1:end-1)+I_x(:,2:end)]/hx;
I_yy=[zeros(1,n); -I_y(1:end-1,:)+I_y(2:end, :)]/hy;
disp('Calculo operador Laplaciano')
Lap=(I_xx+I_yy);
