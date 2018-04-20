clear;
clc;

h = [
    0.01 0.06 0.11 0.16 0.21
    0.26 0.31 0.36 0.41 0.46
    0.51 0.56 0.61 0.66 0.71
    0.76 0.81 0.86 0.91 0.96
    ];

T = [
    0.83944	0.50023	0.33384	0.23811	0.17753
    0.13668	0.10782	0.08716	7.08E-02 5.86E-02
    4.91E-02 4.15E-02 3.53E-02 3.03E-02 2.62E-02
    2.28E-02 1.99E-02 1.75E-02 1.54E-02	1.36E-02
    ];

plot(h,T,'r-')
grid on
xlabel('h')
ylabel('T')
title('Convective Heat Transfer Coefficient to Center Temperature Plot')
    