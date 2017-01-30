## Axthor: Mahmoxd Elbattah
## Created: 2015-03-21
##Plots the ploynomial decision boundary that fits with the "Barn" data samples

#Acknowledgement:
#The example demsonstrated by prof. Adnrew Ng at:
#http://openclassroom.stanford.edu/MainFolder/DocumentPage.php?course=MachineLearning&doc=exercises/ex5/ex5.html
#helped the author to understand how to plot contours using Matlab/Octave
function [vals] = PlotNonLinearDB (theta)

 x=0:0.01:1;
 y=0:0.01:1;

z = zeros(length(x), length(y));

for i = 1:length(x)
    for j = 1:length(y)
         z(i,j) = [1 x(i) y(j).^4]*theta;
    end
end
z = z';
contour(x,y,z, [0, 0],"LineColor","blue")

endfunction
