## Author: Mahmoud Elbattah
## Created: 2015-03-28
## Runs a single experiment including:
## Randomly dividing the dataset into 2/3 training samples and  1/3 test samples. 
## Training three binary Logisitic Regression classifiers
## Testing the classifiers
## Writing the predicted values into a csv file
## Returning the accuracy of classification
function [accuracy] = RunExperiment (samples,sampleLabels)
samplesNo=length(samples);

%Setting the Train/Test ratio ino 2/3 and 1/3 respectively 
trainNo=round(samplesNo*(2/3));
testNo=samplesNo-trainNo;

%Genertaing random indices to be selected from the training samples
rndIndices = randperm(samplesNo);
%Selecting the 2/3 training samples based on the randomly generated indices 
trainSamples=samples(rndIndices(1:trainNo),:);

%Similarly, selecting the 1/3 test samples and their labels based on the randomly generated indices 
testSamples=samples(rndIndices(trainNo+1:samplesNo),:);
testLabels=sampleLabels(rndIndices(trainNo+1:samplesNo),:);

%Initialising "predictions" matrix 
%The "predictions" matrix will contain real-valued confidence score for each of the three classes
%The "predictions" matrix contains three columns to store the predicted values to be classified as 'Longeared', 'Snowy' or 'Barn', respectively.
%The fourth column contains the actual class labels
predictions=[zeros(testNo,3),testLabels];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Training three binary classifiers for 'Longeared', 'Snowy' and 'Barn' respectively.

%First, training the Longeared-Against-All classifier
%Reading the newly constructed labels to train the Longeared-Against-All classifier
%Longeared.csv contains labels as (1->Longeared Owl) (0->Non-Longeared)
labels=csvread('Longeared.csv');

%Selecting the training labels based on the randomly generated indices 
trainLabels=labels(rndIndices(1:trainNo),:);

%Training the Longeared-Against-All classifier with learning Rate=0.1
%Classifier hypothesis was set as :H(O) = O0 + O1 * x1 + O2 * x2
%,where x1-> Body-Area and x2->Wing-Area
%j-> The cost function values over the training process
%theta->The values of the hyposthesis parameters
[j theta]=TrainClassifier (trainSamples,trainLabels,0.1);

%Testing the Longeared-Against-All classifier
%Storing the predictions in the first column, which corresponds to the predictions for being a longeared owl
predictions(:,1)=TestClassifier(testSamples,theta);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Second, training the Snowy-Against-All classifier
%Reading the newly constructed labels to train the Snowy-Against-All classifier
%Snowy.csv contains labels as (1->Snowy Owl) (0->Non-Snowy)
labels=csvread('Snowy.csv');

%Selecting the training labels based on the randomly generated indices 
trainLabels=labels(rndIndices(1:trainNo),:);

%Training the Snowy-Against-All classifier with learning Rate=0.1
%Classifier hypothesis was set as :H(O) = O0 + O1 * x1 + O2 * x2
%,where x1-> Body-Area and x2->Wing-Area
%j-> The cost function values over the training process
%theta->The values of the hyposthesis parameters
[j theta]=TrainClassifier (trainSamples,trainLabels,0.1);

%Testing the Snowy-Against-All classifier
%Storing the predictions in the second column, which corresponds to the predictions for being a snowy owl
predictions(:,2)=TestClassifier(testSamples,theta);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Finally, training the Barn-Against-All classifier
%Reading the newly constructed labels to train the Barn-Against-All classifier
%Snowy.csv contains labels as (1->Barn Owl) (0->Non-Barn)
%Training Barn-Against-All classifier
labels=csvread('Barn.csv');

%Training the Barn-Against-All classifier with learning Rate=0.1
%Classifier hypothesis was set as :H(O) = O0 + O1 * x1 + O2 * x2^4
%,where x1-> Body-Area and x2^4-> (Wing-Area)^4
%j-> The cost function values over the training process
%theta->The values of the hyposthesis parameters
trainLabels=labels(rndIndices(1:trainNo),:);

%Transforming the Wing-Area of the training data according to the classifier hypothesis
%trainSamples(:,2)=trainSamples(:,2).^4;

[j theta]=TrainClassifier (trainSamples,trainLabels,0.1);

%Transforming the Wing-Area of the test data according to the classifier hypothesis
%testSamples(:,2)=testSamples(:,2).^4;

%Testing the Barn-Against-All classifier
%Storing the predictions in the third column, which corresponds to the predictions for being a barn owl
predictions(:,3)=TestClassifier(testSamples,theta);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Writes the predications into a CSV file
csvwrite('predictedOutputs.csv',confidence)

%Measuring the classification accuracy
%Getting the indices of the maximum confidence for every sample
%The index of max confidence can be is 1(Longeared), 2(Snowy) or 3(Barn)
[confidence indices]=max(predictions(:,1:3)');

%Subtracting the indices values from the actual class lables, which were coded as 1(Longeared), 2(Snowy) or 3(Barn)
%If 'diff' is not zero-> a false classification
 diff=abs(indices'-predictions(:,4));
 %Counting the number of false predictions
 falseCount=length(find(diff>0));
 %Calculating the average accuracy
 accuracy=round((1-falseCount/testNo)*100);
 
endfunction
