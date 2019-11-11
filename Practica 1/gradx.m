%% Esta funci�n calcula el gradiente de una imagen en la direcci�n x (filas)
function ux = gradx(u)
% Rellenar:---------------------------------------------------------------%
ux = zeros(size(u));
ux(:, 2:end-1, :) = 1/2*u(:, 3:end, :) - 1/2*u(:, 1:end-2, :);
%-------------------------------------------------------------------------%
end