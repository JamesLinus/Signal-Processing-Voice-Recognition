
function distance = unweighted_distance(a,mean,P)
     distance = zeros(length(a),1);
           
     for n=1:length(a)
         for i=1:P
            temp = a(i,n)-mean;
         end;
            distance(n) = temp*transpose(temp);
     end;
end
     