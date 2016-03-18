function mdistance = mahalanobis(a,mean,P,cov)
    mdistance = zeros(length(a)+1,1);
    invcov = inv(cov);
    for n=1:length(a)
        temp = zeros(P,1);
        for i=1:P
            temp(i,1) = a(i,n)-mean(1,n);
        end;
        mdistance(n) = transpose(temp)*invcov*temp;
    end;
end