%Thermal HW503
%ID: 1001358558
%Name: Ching-Huai Wang

clear;
clc;

%Given parameters
L = 0.1; %(m)
alpha = 0.0001; %(m^-2/s)

n = 6;%number of nodes(assign only even numbers)
delx = L/(n-1);

t = 150; %(s) assume the the total time to be
n_t = 100; %timestep of total time
delt = t/n_t;

%For transient problem, use backward difference for time
Tx0 = 20; %I.C.
T0t = 20; TLt = 40;%(celcius) -- the B.C
%Using the implicit method to model Ax=B

%Matrix B
B = zeros(n+1,1);
B = B+Tx0;
%The bar temp at initial condition

%Matrix A
omega = delx^2/(alpha*delt); %Fourier number
A = zeros(n+1,n+1);
A(1,1) = 1; %B.C.
A(n+1,n+1) = 1; %B.C.
for i=1:1:n-1;
    A(i+1,i+1) = -2-omega; %Center diagonal
    A(i+1,i) = 1; %Sub diagonal
    A(i+1,i+2) = 1; %Upper diagonal
end

%x = A-1*B
array_x = [];
for j = 1:1:n_t
    x = inv(A)*B;
    array_x{j} = x;
    x_cen(j)= x(fix((n+1)/2)+1,1); %Getting the center point of the rod
    B(2:n) = x(2:n)*(-omega); %Replacing the old B with new x w/o B.C.
    B(n+1,1) = TLt; %Setting the B.C. at L after time-marching
    
end
array_x{n_t/2} %Middle of the time
plot(x_cen)
xlabel('Time')
ylabel('Temperature')
title('Center of Rod Temperature-Time Graph')