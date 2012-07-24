function [not_dominant M] = analyze_dominance(A)

n = length(A);
dA = abs(sum(A))';
s = dA./diag(A);
not_dominant = find(s<1e-14);
if  (nargout==2)
    dominant = find(s>=1e-14);
    M = abs(A-diag(diag(A)));
    [i j v] = find(M); 
    i = i+1;
    j = j+1;
    nv = dA(dominant);
    dominant = dominant+1;
    v = [v; nv;nv];
    i = [i; ones(length(dominant),1); dominant];
    j = [j; dominant; ones(length(dominant),1)];
    M = sparse(i,j,v,n+1,n+1);
    M = laplacian(M);
end
