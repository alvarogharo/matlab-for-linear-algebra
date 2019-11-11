%% Esta funci�n calcula el gradiente de una imagen en la direcci�n y (columnas)
function uy = grady(u)
% Rellenar:---------------------------------------------------------------%
uy = zeros(size(u));
uy(2:end-1, :, :) = 1/2*u(3:end, :, :) - 1/2*u(1:end-2, :, :);
%-------------------------------------------------------------------------%
end