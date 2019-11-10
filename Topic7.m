%% 7.1 Ejemplo
syms x
f=(x.^3-x).*exp(-x)
eje=0.*x
p1=taylor(f,x,'ExpansionPoint', 0,'Order',2)
p2=taylor(f,x,'ExpansionPoint', 0,'Order',3)

% error en un punto
x_0=0.1
exacto=double(subs(f,x_0))
L=double(subs(p1,x_0))
C=double(subs(p2,x_0))
error_L=abs(exacto-L)/abs(exacto)
error_C=abs(exacto-C)/abs(exacto)
% grafica
a=1
figure
ezplot(f,[-a,a])
hold on
ezplot(p1,[-a,a])
hold on
ezplot(p2,[-a,a])
hold on
ezplot(eje,[-a,a])
hold on
plot(0,0,'k*')
legend('Funci´on', 'Aproximacion lineal de Taylor' , 'Aproximacion cuadratica de Taylor')

%% Ejemplo 7.3
syms x y
f=log(x^2+ y^2+1);
% gradiente
fx=diff(f,x);
fy=diff(f,y);
G=[fx;fy];
% puntos criticos
[xcr,ycr]=solve(fx,fy);
[xcr,ycr]
a=2
figure
fsurf(f,[-a,a,-a,a],'MeshDensity',80)
xlabel('x');
ylabel('y');
view(-155,14)
figure
fsurf(fx,[-a,a,-a,a],'MeshDensity',80)
xlabel('x');
ylabel('y');
view(-146,44)
figure
fsurf(fy,[-a,a,-a,a],'MeshDensity',80)
xlabel('x');
ylabel('y');
view(-146,44)
%title(' Parcial y')


%% 7.1
syms x y
f=log(x^2+ y^2+1);
grad_f = gradient(f)

epsilon = 1e-1;
tolerance = 1e-6;
itermax = 100
x0 = 1;
y0 = 2;

xy = [x0,y0]'
err= double(subs(grad_f, {x, y}, {xy(1), xy(2)}))
error = norm(err)

iter = 0
while error > tolerance & iter <= itermax
    xy = xy - epsilon*err;
    err = double(subs(grad_f, {x, y}, {xy(1), xy(2)}));
    error = norm(err);
    iter = iter +1;
end

iter
xy

%% 7.2
syms x y
f=x^2- y^2;
grad_f = gradient(f)
hess_f = hessian(f)
hess_f = jacobian(grad_f)

%Como hay autovalores negativos y positvos es un punto de silla
eig(hess_f)

%% 7.3
syms x y
f=exp(-(x-1)^2-y^2);
grad_f = gradient(f);
hess_f = hessian(f);

epsilon = 1e-1;
tolerance = 1e-6;
itermax = 1000
x0 = 0.75;
y0 = -0.4;

xy = [x0,y0]'
%xy = rand(2,1)
err= double(subs(grad_f, {x, y}, {xy(1), xy(2)}))
hess_xy = double(subs(hess_f, {x, y}, {xy(1), xy(2)}))
error = norm(abs(err))
cond

iter = 0
while error > tolerance & iter < itermax
    hess_xy = double(subs(hess_f, {x, y}, {xy(1), xy(2)}))
    if err'*hess_xy*err > 0
        epsilon = (err'*err)/(err'*hess_xy*err);
    else
        epsilon = 1/max(eig(hess_xy));
    end
    xy = xy - epsilon*(inv(hess_xy)*err)
    err = double(subs(grad_f, {x, y}, {xy(1), xy(2)}));
    error = norm(abs(err));
    iter = iter +1;
end

iter
xy