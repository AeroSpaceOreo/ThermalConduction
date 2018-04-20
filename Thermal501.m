%Thermal HW501
%ID: 1001358558
%Name: Ching-Huai Wang

clear;
clc;

%Given parameters
L = 1; %(m)
Area = 0.001; %(m^2) since A is so small
%we can consider it as an one dimensional problem

for n = [5 11 51 101]; %n nodes, n-1 cells
%Boundary Conditions
%T(0) = 100;
%T(L) = 0;

%%Exact Solution
syms T(x) dT(x) ddT(x) x
%Governing equation(1-D/no heat gen/no time steady-state)
%ddT/dx^2 == 0
dT = diff(T,x);
ddT = diff(dT,x);

%Exact solution
T = dsolve(ddT == 0,T(0) == 100, T(L) == 0);
l = linspace(0,L,n);

Texact = double(subs(T,x,l));

delx = L/(n-1);
%%Creating problem matrice
%Ax = B, where x = B/A
syms A B
%A matrix
A(1,1) = 1; A(n,n) = 1;
for i = 1:1:n-2
    A(i+1,i+1) = -2;
    A(i+1,i) = 1;
    A(i+1,i+2) = 1;
end
%B matrix
B(2:n-1) = 0;
B(1,1) = 100; B(n) = 0; %Boundary Conditions
Bt = B'; %Bt is tranpose of B

invA = inv(A);
Tapprox = invA*Bt; %Since if Ax = B, x = A^-1 * B, A^-1 as inverse of A

%%Plot
plot(l,Texact,'b-')
grid on
hold on
plot(l,Tapprox,'ro')
xlabel('Length')
ylabel('Temperature')
title('Temperature-Length Graph')
end
hold off