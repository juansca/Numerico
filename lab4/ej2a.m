xs = linspace(0, 1, 50);
ys = asin(xs);


coefs = polyfit(xs, ys, 0);
new_ys0 = polyval(coefs, xs);

coefs = polyfit(xs, ys, 1);
new_ys1 = polyval(coefs, xs);

coefs = polyfit(xs, ys, 2);
new_ys2 = polyval(coefs, xs);

coefs = polyfit(xs, ys, 3);
new_ys3 = polyval(coefs, xs);

coefs = polyfit(xs, ys, 4);
new_ys4 = polyval(coefs, xs);

coefs = polyfit(xs, ys, 5);
new_ys5 = polyval(coefs, xs);

plot(xs, ys, '.r;data;',xs, new_ys0, 'b;N0;' ,xs, new_ys1, 'm;N1;' ,xs, new_ys2, 'g;N2;' ,xs, new_ys3, 'k;N3;' ,xs, new_ys4, 'y;N4;',new_ys5 ,'c;N5;');
pause();
