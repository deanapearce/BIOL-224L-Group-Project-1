% This program calls sir_model on all units of the parameter space
%% Initial parameters
a1 = 0.5;       % 0<value<1 % probability of infection for strain 1
a2_start = 0.5; % 0<value<1 % probability of infection for strain 2
b1 = 0.3;       % 0<value<1 % probability of recovery for strain 1
b2_start = 0.2; % 0<value<1 % probability of recovery for strain 2
t_intr = 10;    % time of introduction of new strain
t_end = 100;    % time of end of simulation
d = 0.1;          % timescale dilator
n = 100;        % size of population

%% More parameters & loop
% step/resolution 
step = 0.01; 

% end of a2, b2 parameter 
a2_end = 0.8; 
b2_end = 0.5; 

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
title(strcat("Time to Strain 2 Dominance Against Strain 1 (a1=", string(a1), ", b1=", string(b1), ")"))
