%% Esta funci�n calcula las energ�as: Total, apriori y fidelidad.
function [energy, prior, fidelity]=Energy(u,f,lambda)
% Prior
dim = size(u);
Omega = dim(1)*dim(2);
ux = gradx(u);
uy = grady(u);
modGrad = sqrt(ux.^2+uy.^2);
fi = (u-f).^2;

prior = 1/2*sum(modGrad(:).^2)/Omega;
% Fidelity
fidelity= 1/2*sum(lambda(:).*fi(:))/Omega;
% Total Energy
energy= prior + fidelity; 
end