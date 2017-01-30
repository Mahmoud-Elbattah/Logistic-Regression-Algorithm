## Author: Mahmoud Elbattah
## Created: 2015-03-24
##Tests a binary logisitic regression classifier parameterised by 'parameters' against 'testSamples'
function [predictions] = TestClassifier(testSamples, parameters)

%Adding the intercept parameter (?0)
testSamples = [ones(length(testSamples), 1), testSamples];

%Calculating the hypothesis prediction
predictions=Logisticf(testSamples*parameters);

endfunction
