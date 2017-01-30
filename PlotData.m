## Author: Mahmoud Elbattah
## Created: 2015-03-21
##Plots the data with respect to the three classes of "Longeared", "Snowy" and "Barn"
function PlotData (x, y)
plot(x(1:45),y(1:45),'o','color','red','markersize',12);
hold on;
plot(x(46:86),y(46:86),'+','color','blue','markersize',12);
hold on;
plot(x(87:130),y(87:130),'*','color','magenta','markersize',12);
legend('Long-Eared Owl','Snowy Owl','Barn Owl');
legend location northeastoutside;
xlabel('Body Area');
ylabel('Wing Area');
endfunction
