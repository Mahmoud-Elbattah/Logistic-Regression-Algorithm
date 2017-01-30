## Author: Mahmoud Elbattah
## Created: 2015-03-24
## Plots linear decision boundaries 
function [retval] = PlotLinearDB (X, theta)

Y= ((-(X(:,1).*theta(2))-theta(1))./theta(3));
plot(X(:,1),Y);


endfunction
