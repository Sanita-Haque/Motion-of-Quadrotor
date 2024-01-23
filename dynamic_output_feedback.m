%% Dynamic output feedback via pole placement
clc; clear; close all;

% cart-pole system
sys = cartpole();

% time vector
t = 0:0.1:20;

% equilibrium for 'up' position
xtilde = [3 0 pi 0]';
utilde = 0;

% initial condition (slightly left of vertical)
x0 = [-3 0 pi+0.1 0]';
xhat0 = [-3 0.01 pi+0.1 0]';

% linearization
[A,B] = sys.linearize(xtilde,utilde);

% output (x)
C = [1 0 0 0];
D = 0;

% eigenvalues of A+BK
pK = [-102 -0.75+1i*0.8 -0.75-1i*0.8 -0.8];

% eigenvalues of A+LC
pL = [-0.44 -1.07 -2.36 -2.67];

% place the closed-loop eigenvalues
K = -place(A,B,pK);
L = -place(A',C',pL)';

% simulate the system
x = sys.dynamic_output_feedback(t,[x0; xhat0],L,K,xtilde,utilde,C,D);

% visualize the dynamics
sys.draw(x);
