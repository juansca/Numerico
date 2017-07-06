data = load('datos_aeroCBA.dat');

data = data(!isnan(data(1:end, 3)), 1:end);

years = data(1:end, 1);
temps = data(1:end, 3);
dates = 1957:2020;

p = interp1(years, temps, dates, 'spline', 'extrap');

plot(dates, p, 'b;Spline Interp;', years, temps, '.r;Data Points;');
sleep(3);
xlabel("Año");
ylabel("Temperatura");
pause();
