%% Ejemplo 8.3
clc;
% Funcion generadora de los datos
d = linspace(0,3);
y = exp(-1.3*d) + 0.05*randn(size(d));

% Funcion de aproximacion
fun = @(r)exp(-d*r)-y;
x0 = 4;
x = lsqnonlin(fun,x0)
plot(d,y,'ko',d,exp(-x*d),'b-')
legend('Data','Best fit')
xlabel('t')
ylabel('exp(-tx)')

%% 8.1
clc;
syms x y
f=[x-0.4, y-0.8, x^2+y^2-1];
jac_f = jacobian(f)

epsilon = 1;
tolerance = -1;
itermax = 100;
x0 = 100;
y0 = 16545646;

xy0 = [x0,y0]';
%xy0 = rand(2,1)
xy = xy0;
f_xy0 = double(subs(f, {x, y}, {xy0(1), xy0(2)}))'
stop_err = double(subs(jac_f, {x, y}, {xy0(1), xy0(2)}))*(xy - xy0);
 err = f_xy0 + stop_err;
error = norm(err);

iter = 0
while norm(stop_err) > tolerance & iter < itermax
    xy0 = xy;
    xy = xy0 - epsilon*pinv(double(subs(jac_f, {x, y}, {xy0(1), xy0(2)}))) * double(subs(f, {x, y}, {xy0(1), xy0(2)}))';
    f_xy0 = double(subs(f, {x, y}, {xy0(1), xy0(2)}))';
    stop_err = double(subs(jac_f, {x, y}, {xy0(1), xy0(2)}))*(xy - xy0);
    err = f_xy0 + stop_err;
    error = norm(err)
    iter = iter + 1;
end

iter
xy