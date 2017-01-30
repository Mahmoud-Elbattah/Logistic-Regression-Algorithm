## Author: Mahmoud Elbattah
## Created: 2015-03-24
##Plots the cost function values over a set of iterations
##Helps to ensure the convergnence of the cost function
function PlotLearningRate (J)
iterations=1:length(J);
plot(iterations,J);
xlabel('No. of Iterations');
ylabel('Cost Function J');
endfunction
