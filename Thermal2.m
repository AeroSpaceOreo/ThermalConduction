clc; 
clear;

%given known
a = 2; b = 2;
ymx = 2*a; ymn = 0;
x = b/2; %y=a/2
nmx = 100;
divide = 100;
dy = (ymx-ymn)/divide; %dx = (xmx-xmn)/divide

%Start loop
for i = 1:(divide+1)
    vector(i) = ymn+dy*(i-1);
    sum = 0;
    for n=1:nmax
        t(n)=(2*(20-10*cos(n*pi))*sin(n*pi*vector(i)/(2*a))*(exp(n*pi*x)/(2/a))*exp(-n*pi*x/(2*a))*exp(n*pi*b/a))/(n*pi*(1-exp(n*pi*b/a)));
        s = s+t(n);
        s
    end
end
