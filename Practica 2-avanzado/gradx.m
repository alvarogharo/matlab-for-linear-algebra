%% Esta funci�n calcula el gradiente de una imagen en la direcci�n x (filas)
function ux = gradx(u,type)
if nargin < 2
    type = 'central';
end
% Rellenar:---------------------------------------------------------------%
switch type
    case 'central'
        ux=zeros(size(u));
        ux(:,2:end-1, :)=0.5*u(:,3:end,:)-0.5*u(:,1:end-2,:);
    case 'forward'
        ux=zeros(size(u));
        ux(:,1:end-1, :)=u(:,2:end,:) - u(:,1:end-1,:);
    case 'backward'
        ux=zeros(size(u));
        ux(:,2:end, :)= u(:,2:end,:) - u(:,1:end-1,:);
%-------------------------------------------------------------------------%
end