clc;
clear all;
m=0.18;
j=2.5*10^(-4);
g=9.8;
% m= m;
% j = j;
% S= S;
% symbolic variables (assumed to be real)
syms m j S L1 L2 L3 L4 L5 L6 real
A= [0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 -g 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0];
B= [0 0 0; 0 0 0; 0 0 0; 0 0 0; -1/m 0 -1; 0 1/j 0];
%B= [0 0 0; 0 0 0; 0 0 0; 0 0 0; 1 0 -1; 0 1 0];
C= [1 0 0 0 0 0; 0 1 0 0 0 0];
D=[0 0 0;0 0 0];

sys = ss(A,B,C,D);
figure(1)
step(sys)
hold on;
Pol  = pole(sys);
p=[-1 -2 -1 -2 -1 -2];

%C= [1 0 0 0 0 0];
%S1= [S 0 0 0 0 0; 0 S 0 0 0 0; 0 0 S 0 0 0; 0 0 0 S 0 0; 0 0 0 0 S 0; 0 0 0 0 0 S];
%I= [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1];
%H= C*(S1-A)^(-1)*B;
%E=eig(S1)
L=[L1; L2; L3; L4; L5; L6]

K=-place(A,B,p);

Obs=A+L*C
%L=Obs.*(C.^(-1))-A

