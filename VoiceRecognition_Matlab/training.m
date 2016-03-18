
%%Train the computer to 'know' a voice%%
function [a] = training(P,StartingSample,EndingSample,StartEndPoints,user)
 %%In order to train the computer to know a voice we calculate the LP of
 %%the coeffecients for each word. This will be stored in a array of
 %%vectors. The calculation of a is as follows: a = transpose of R times r.
 %%For more details search: Linear Progression.
 
 user = abs(user);                                                          %P, The accuracy of data manipulation
 a = zeros(P,(EndingSample-StartingSample));                         %defined as Rtranspose times r
 for CurrentSample=StartingSample:EndingSample   
    r = zeros(P,1);                                        
    R = zeros(P,P);   
    %%r%%and%%R%%
    for n = P+1+StartEndPoints(CurrentSample,1):StartEndPoints(CurrentSample,2)
        for i = 1:P
            r(i) = r(i) + user(n)*user(n-i);
            for j = 1:P
                R(i,j) = user(n-i)*user(n-j) + R(i,j);
            end;
        end;
    end;
    coeff = R\r;
    for i = 1:P
        a(i,(CurrentSample-StartingSample+1)) =  coeff(i);
    end;
end;

%figure
%plot(a(1, :),a(2, :),'r*');
% % hold on;
% % plot(a2(1, :),a2(2, :),'g*');
% % plot(a3(1, :),a3(2, :),'b*');
% % legend('User 1','User 2','User 3