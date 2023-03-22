a1 = 0.14;       % 0<value<1 % probability of infection for strain 1
b1 = 0.105;   % 0<value<1 % probability of infection for strain 2
b1 = 0.14; % 0<value<1 % probability of recovery for strain 1
b2 = 0.105; % 0<value<1 % probability of recovery for strain 2
t_intr = 100; % time of introduction of new strain
t_end = 1000; % time of end of simulation
d = 1; % timescale dilator
n = 300000000; % size of population
fig = 1;

sir_model
