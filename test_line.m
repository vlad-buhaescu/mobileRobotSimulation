colors=['b','g','r','c','m','y','k'];
l_type=['-.',':','-','--'];

 i=[10,20,30,40,50,60,70,80,90];
 j=1:2:41;
 axis([0 120 0 120]);
% 
for k=2:1:length(i)-1
line( [ i(k-1) i(k)],[i(k) i(k+1)],[i(k+1) i(k+1)] , 'Color',colors(1) ,'LineStyle',l_type(3) );
pause(0.2)
end