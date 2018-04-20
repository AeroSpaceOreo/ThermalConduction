%%ME5316 Hw4 Question2
%ID:1001358558
%Name:Ching Huai Wang

%% Given Datas
clc;
clear;

syms r z t;

rad = 0.013*1000; %radius of cylinder in mm
length = 0.065*1000; %length of cylinder in mm
T0 = 10; %initial temperature
k = 10; % the heat conduction coefficient(W/mK)
J0 = [  2.4048  5.5201  8.6537  11.7915 14.9309
        18.0711 21.2116 24.3525 27.4935 30.6346 ]; %Bessel function roots
eigen = J0/rad; % lamda*R = roots

%% Temperature Equation
T = 0; % initial temperature
for i = 1:10
    eig = eigen(i);
    Cn = 2*T0*besselj(1,eig*rad)/(eig*rad*(besselj(1,eig*rad)^2+besselj(0,eig*rad)^2)*exp(eig)*(1-exp(2*length)));
    T = T+Cn*1*exp(eig)*(exp(z)-exp(2*length-z));
    Cn;
end
x = linspace(0,length/1000,10); %create spatial
T_cen = subs(T,z,x)
subplot(2,1,1)
plot(x,T_cen)

%% HW4 Question 3
T2 = 0; % initial
al = 97; % Al  mm^2/s
for i = 1:10
    eig = eigen(i);
    Cn = 2*T0*besselj(1,eig*rad)/(eig*rad*(besselj(1,eig*rad)^2+besselj(0,eig*rad)^2));
    T2 = T2+Cn*1*exp(-al*eig^2*t);
    Cn;
end
time = linspace(0,3,80);
T2_center = subs(T2,t,time)
subplot(2,1,2)
plot(time,T2_center)
