% This program calls sir_model on all units of the parameter space
%% Initial parameters
a1 = 0.294;       % 0<value<1 % probability of infection for strain 1
b1 = 0.143;       % 0<value<1 % probability of recovery for strain 1
%a1 = 0.14;       % 0<value<1 % probability of infection for strain 1
%b1 = 0.105;       % 0<value<1 % probability of recovery for strain 1

a2_start = 0; % 0<value<1 % probability of infection for strain 2
a2_end = 1; 
b2_start = 0; % 0<value<1 % probability of recovery for strain 2
b2_end = 1; 

t_intr = 100;    % time of introduction of new strain
t_end = 1000;    % time of end of simulation
d = 1;          % timescale dilator
n = 300000000;        % size of population

%% More parameters & loop
% step/resolution 
step = 0.1; 

% display figure every time? no, never do this.
fig = 0;

%% loop

% list to traverse
a2_list = a2_start:step:a2_end
b2_list = b2_start:step:b2_end

% empty matrix to hold response
n_a2 = int16((a2_end - a2_start) / step);
n_b2 = int16((b2_end - b2_start) / step);
response = zeros(n_a2, n_b2);
 
% Traverse parameter space
for k = 0:n_a2
    % a2 parameter value
    a2 = a2_start + double(k)*step
    for l = 0:n_b2
        % b2 parameter values
        b2 = b2_start + double(l)*step
        sir_model
        response(k+1, l+1) = ans;
    end 
end 

%% Create heatmap based on matrix
figure
heatmap(response, 'Colormap', spring, ...
    "XDisplayLabels", b2_list, ...
    "YDisplayLabels", a2_list)
xlabel("b2")
ylabel("a2")
title({strcat("Time to Dominance Against Strain 1 (a1=", string(a1), ", b1=", string(b1), ")"), ...
    strcat("(Introduced after ", string(t_intr), " days)")})

