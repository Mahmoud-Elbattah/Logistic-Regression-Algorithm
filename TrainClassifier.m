## Author: Mahmoud Elbattah
## Created: 2015-03-24
##Trains a binary logisitic regression classifier with 'alpha' learning rate
##Returns hypothesis parameters 'theta' 
##And returns 'J' as the recorded values of the cost function over the training process

#Acknowledgement:
#The Machine Learning course provided by prof. Adnrew Ng on Coursera helped the author to understand how to implement the Logistic Regression Algorithm

function [J,theta] = TrainClassifier (trainSamples,labels,alpha)
% samplesNo--> Number of training samples
%featuresNo--> Number of features
[samplesNo, featuresNo] = size(trainSamples);

%Adding the interept parameter(?0)
trainSamples = [ones(samplesNo, 1), trainSamples];

%Initialising hypothesis paramteters
theta = zeros(featuresNo+1, 1);

%Initialising the loop counter to be used within Gradient Descent optimisation
iter =1;
%Initial value for the cost function
J(iter)=1;

while(J(iter)>0.01&&iter<4000000)%Loop until convergence of the cost function  

%Calculating the predicted values with repect to the current hypotesis parameterised by theta values
H= Logisticf(trainSamples*theta);

%Calculating the gradient (the differentiation of the curve at that point)
gradient = (trainSamples'*(H - labels))./samplesNo;
%Updating values of theta vector simulutaneously 
theta = theta - alpha*gradient;
%Incrementing the loop counter
iter=iter+1;
%Recording the current cost function value
J(iter) =( -labels' * log(Logisticf(trainSamples * theta))- (1-labels') * log(1-Logisticf(trainSamples *theta)))./samplesNo;

end

endfunction
