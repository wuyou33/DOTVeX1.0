function sys = example_1_7()

% This is the pre-defined example for sliding mode observer with unknown input
% Respective matrix and vector values are shown below
% Also contain control input vector 'u' and unknown input vector 'w'

%% System/Plant Dynamics

% x_dot = A x + B_u u + B_w w
% y = C x + D_u u 

%% dim: structure containing dimensions of randomly generated system
% dim.nx = # of states
% dim.ny = # of outputs
% dim.nw = # of unknown inputs
% dim.nv = # of noisy sensors

%% sys: structure containing the system of ODEs

%System matrix
sys.A = [0.0000 0.0000 1.0000 0.0000 0.0000
0.0000 -0.1540 -0.0042 1.5400 0.0000
0.0000 0.2490 -1.0000 -5.2000 0.0000
0.0386 -0.9960 -0.0003 -0.1170 0.0000
0.0000 0.5000 0.0000 0.0000 -0.5000];

%Input matrix
sys.Bu = zeros(5,2);

%Control inputs
sys.u = {'0'; '0'};

%Output matrix  
sys.C = [0 1 0 0 -1;
0 0 1 0 0;
0 0 0 1 0;
1 0 0 0 0];   

%Unknown input matrix
sys.Bw = [0.0000 0.0000;
        -0.7440 -0.0320;
         0.3370 -1.1200;
         0.0200 0.0000;
         0.0000 0.0000];
sys.w = {'0.5*sin(5*t)'; '0.5*cos(2*t)'};


sys.Du = zeros(size(sys.C,1),size(sys.Bu,2));

%Distrurbances/attack vector
sys.Dv = zeros(size(sys.C,1));


sys.gamma = 1;

sys.dim.nx = size(sys.A, 1);        % number of states
sys.dim.nu = size(sys.Bu, 2);       % number of control inputs
sys.dim.nw = size(sys.Bw, 2);       % number of unknown inputs
sys.dim.ny = size(sys.C, 1);        % number of outputs

% save('sys.mat', 'sys');