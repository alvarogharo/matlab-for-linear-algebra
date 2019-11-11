%% Esta funci�n calcula el gradiente de una imagen en la direcci�n y (columnas)
function uy = grady(u,type)
if nargin < 2
    type = 'central';
end
% Rellenar:---------------------------------------------------------------%
switch type
    case 'central'
        uy=zeros(size(u));
        uy(2:end-1, :, :)=0.5*u(3:end,:,:)-0.5*u(1:end-2,:,:);
    case 'forward'
        uy=zeros(size(u));
        uy(1:end-1, :, :)=u(2:end,:,:) - u(1:end-1,:,:);
    case 'backward'
        uy=zeros(size(u));
        uy(2:end,:,:)= u(2:end,:,:) - u(1:end-1,:,:);
%-------------------------------------------------------------------------%
end