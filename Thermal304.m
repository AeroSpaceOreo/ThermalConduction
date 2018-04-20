%me5316 hw3-4
clc;
clear;

L = 31 %length, range for graph
acc = 0.8 %accuracy for loop

%Bessel function, 1st kind of J0
eq1 = besselj(0,x);
eq2 = 0*x;

%Plot
ezplot(eq1,[0 L]);
hold on;
ezplot(eq2,[0 L]);

grid on;
legend('J0','0');
axis([0 L -1 1]); grid on;

%Numerical Values
temproot=0; k=1;% initial
for i= 1:acc:L
    sol=vpasolve(eq1==eq2,x,i); %locate solutions near i
    if temproot < sol-0.5  % -1
    k=k+1;
    J0(k,1)=sol;
    temproot=sol;
    end
end
J0(1)=[]; % take 1st off
