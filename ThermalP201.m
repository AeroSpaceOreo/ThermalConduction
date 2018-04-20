%Thermal Project102
%ID: 1001358558
%Name: Ching-Huai Wang

clear;
clc;

%Given parameters
L = 0.1; %(m)
for alpha = [8.2e-8 1.11e-4]; %m^2/s,Wood:8.2e-8/Copper:1.11e-4

n = 6;%number of nodes(assign only even numbers)
delz = L/(n-1);

t = 1500; %(s) assume the the total time to be
n_t = 100; %timestep of total time
delt = t/n_t;

%For transient problem, use backward difference for time
Tz0 = 20; %I.C.
T0t = 20; TLt = 1400;%(celcius) -- the B.C
%Using the implicit method to model Ax=B

%Matrix B
B = zeros(n+1,1);
B = B+Tz0;
%The bar temp at initial condition

%Matrix A
omega = delz^2/(alpha*delt); %Fourier number
A = zeros(n+1,n+1);
A(1,1) = 1; %B.C.
A(n+1,n+1) = 1; %B.C.
for i=1:1:n-1;
    A(i+1,i+1) = -2-omega; %Center diagonal
    A(i+1,i) = 1; %Sub diagonal
    A(i+1,i+2) = 1; %Upper diagonal
end

%x = A-1*B Using Cramer's Rule to solve the question
array_z = [];
for j = 1:1:n_t
    x = inv(A)*B;
    array_z{j} = x;
    z_cen(j)= x(fix((n+1)/2)+1,1); %Getting the center point of the rod
    B(2:n) = x(2:n)*(-omega); %Replacing the old B with new x w/o B.C.
    B(n+1,1) = TLt; %Setting the B.C. at L after time-marching
    
end
disp('At thermal diffusivity of')
disp(alpha)
disp('The temperature distribution of the rod is:')
temp = array_z{2}; %At some moment of the transient time
disp(temp')
disp('The average temperature temp of the rod is:')
avgtemp = sum(temp)/7;
disp(avgtemp)
disp('------------------------')

disp('At thermal diffusivity of')
disp(alpha)
disp('The temperature distribution of the rod is:')
tempSS = array_z{n_t}; %Steady State time
disp(tempSS')
disp('The average temperature temp of the rod is:')
avgtemp = sum(tempSS)/7;
disp(avgtemp)
disp('------------------------')



plot(z_cen)
xlabel('Time')
ylabel('Temperature')
title('Center of Rod Temperature-Time Graph')
hold on

end
hold off