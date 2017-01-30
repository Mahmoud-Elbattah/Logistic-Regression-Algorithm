## Author: Mahmoud Elbattah
## Created: 2015-03-21
##Returns the value of a logisitc function
function y = Logisticf(x)

y = 1./(1 + e.^-x);

endfunction
