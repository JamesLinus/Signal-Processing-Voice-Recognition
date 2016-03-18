clearvars
load('user1.mat');
load('user2.mat');
load('user3.mat');

%Preliminary: define parameters% 

P = 2;          %Increase P for better accuracy, but requires larger amount of data processing
TrainingSample = 15;      %Increase wave for more Coeffecients / samples.
TotalSample = 30; %Set to total number of samples

%Phase 1: Isolate Sound %

StartEndPoints1 = isolation(user1);
StartEndPoints2 = isolation(user2);
StartEndPoints3 = isolation(user3);

%Phase 2: Find Coeffecients %

a1 = training(P,1,TrainingSample,StartEndPoints1,user1);
a2 = training(P,1,TrainingSample,StartEndPoints2,user2);
a3 = training(P,1,TrainingSample,StartEndPoints3,user3);

%Phase 3: Means & Covariances %

mean1 = mean(a1(:,1:TrainingSample));
mean2 = mean(a2(:,1:TrainingSample));
mean3 = mean(a3(:,1:TrainingSample));

cov1 = cov(transpose(a1(:,1:TrainingSample)));
cov2 = cov(transpose(a2(:,1:TrainingSample)));
cov3 = cov(transpose(a3(:,1:TrainingSample)));

%Phase 4: Coeffecients for testing.

Test1 = training(P,TrainingSample+1,TotalSample,StartEndPoints1,user1);
Test2 = training(P,TrainingSample+1,TotalSample,StartEndPoints2,user2);
Test3 = training(P,TrainingSample+1,TotalSample,StartEndPoints3,user3);

%Phase 5: Statistics methods for testing

distance1 = [unweighted_distance(Test1,mean1,P),unweighted_distance(Test1,mean2,P),unweighted_distance(Test1,mean3,P)];
distance2 = [unweighted_distance(Test2,mean1,P),unweighted_distance(Test2,mean2,P),unweighted_distance(Test2,mean3,P)];
distance3 = [unweighted_distance(Test3,mean1,P),unweighted_distance(Test3,mean2,P),unweighted_distance(Test3,mean3,P)];

error_unweighted = [error_testing(distance1, 1),error_testing(distance2, 2),error_testing(distance3, 3)];
error_mean_unweighted = mean(error_unweighted);

fprintf('\t Unweighted distance average error: %f percent\n',error_mean_unweighted);

mdistance1 = [mahalanobis(Test1,mean1,P,cov1),mahalanobis(Test1,mean2,P,cov2),mahalanobis(Test1,mean3,P,cov3)];
mdistance2 = [mahalanobis(Test2,mean1,P,cov1),mahalanobis(Test2,mean2,P,cov2),mahalanobis(Test2,mean3,P,cov3)];
mdistance3 = [mahalanobis(Test3,mean1,P,cov1),mahalanobis(Test3,mean2,P,cov2),mahalanobis(Test3,mean3,P,cov3)];

error_mahanlanobis = [error_testing(mdistance1, 1),error_testing(mdistance2, 2),error_testing(mdistance3, 3)];
error_mean_mahalanobis = mean(error_mahanlanobis);

fprintf('\t Mahalanobis average error: %f percent\n',error_mean_mahalanobis);


figure
hold on
plot(a1(1, :),a1(2, :),'r*');
plot(a2(1, :),a2(2, :),'g*');
plot(a3(1, :),a3(2, :),'b*');
legend('User 1','User 2','User 3');

