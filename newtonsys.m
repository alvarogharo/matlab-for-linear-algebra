function [x,res,niter] = newtonsys(Ffun,Jfun,x0,tol,...
                                nmax, varargin)
%NEWTONSYS halla un cero de un sistema no lineal.
%   [ZERO,F,ITER]=NEWTONSYS(FFUN,JFUN,X0,TOL,NMAX)
%   trata de hallar el vector ZERO. RES contiene el 
%   valor del residuo
%   en ZERO y NITER el numero de iteraciones necesarias
%   para calcular ZERO. FFUN e JFUN son funciones
%   definidas a travs de M-file

niter = 0;
err = tol + 1;
x = x0;
while err >= tol & niter < nmax
    J = Jfun(x,varargin{:});
    F = Ffun(x,varargin{:});
    delta = - J\F;
    x = x + delta;
    err = norm(delta);
    niter = niter + 1;
end
res = norm(Ffun(x,varargin{:}));
if (niter==nmax & err> tol)
    fprintf(['El metodo no converge en el numero maximo ',...
       'de iteraciones. La ultima iteracion \n',...
       'El iterante resuelto tiene un residuo relativo %e\n'],F);
%else
%    fprintf(['El metodo converge en %i iteraciones',...
%            ' con un residuo de %e \n'],niter,F);
end
return
