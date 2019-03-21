X = test1.';
dist = 'euc';
[n,p] = size(X); %n=row p=col
outClass = class(X);
    Y = zeros(1,n*(n-1)./2, outClass);
    %Z = zeros(1,n*(n-1)./2, outClass);%%
    k = 1;
    %i=4;
    for i = 1:n-1 %%row
            dsq = zeros(n-i,1,outClass);
                for q = 1:p %total col
                    dsq = dsq + (X(i,q) - X((i+1):n,q)).^2;
                end
                if strcmp(dist,'euc')
                   Y(k:(k+n-i-1)) = sqrt(dsq);
                else
                   Y(k:(k+n-i-1)) = dsq;
                end
   end
