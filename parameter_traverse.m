% This program calls sir_model on all units of the parameter space
%%
% step/resolution 
step = 0.1; 
 
% start/end of a2 parameter 
a2_start = 0.1; 
a2_end = 0.3; 
 
% start/end of b2 parameter 
b2_start = 0.1; 
b2_end = 0.3; 

% empty matrix to hold response
n_a2 = int16((a2_end - a2_start) / step);
n_b2 = int16((b2_end - b2_start) / step);
response = zeros(n_a2, n_b2);
 
% Traverse parameter space
for i = 0:n_a2
    for j = 0:n_b2
        % a2 and b2 parameter values
        a2 = a2_start + double(i)*step
        b2 = b2_start + double(j)*step
        out = rand();
        response(i+1, j+1) = out;
    end 
end 

%% Create heatmap based on matrix
heatmap(response, 'Colormap',spring)
title("[Example] Time to dominance")
