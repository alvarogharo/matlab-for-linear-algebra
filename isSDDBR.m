function [isDiagonallyDominantByRow] = isSDDBR(A)
rowSum = sum(abs(A),2)';
dia    = abs(diag(A))';
isDiagonallyDominantByRow = all(rowSum < 2 * dia);
end

