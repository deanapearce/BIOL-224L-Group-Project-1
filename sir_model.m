% Vector of time steps
t = 0:d:t_end;
% Number of total time points
n_t = floor(t_end / d);

% timestep index at which to introduce strain 2
i_intr = ceil(t_intr / d);

% Matrix representing state:
% S:  99 ...
% I1: 1 ...
% I2: 0 ... 1 ...
% R:  0 ...
M = zeros(4, n_t);

% Set first Susceptible value at time 1 to N - 1
M(1,1) = n - 1;

% Set Infected 1 value at time 0 to 1
M(2,1) = 1;

% Dummmy a2
d_a2 = a2*(1-a1);

for i=1:(n_t-1);
    % Introduce Strain 2 by taking out of Susceptible
    if i == i_intr
        M(3, i) = 1;
        M(1, i) = M(1, i) - 1;
    end
    % Susceptible
    M(1, i+1) = M(1, i) - d * M(1, i) / n * (a1*M(2,i) + a2*M(3,i));
    % Strain 1
    M(2, i+1) = M(2, i) + d * (a1*M(1, i)* M(2, i) / n - b1 * M(2, i));

    % After Strain 2 is introduced...
    if i >= i_intr            
        M(3, i+1) = M(3, i) + d * (a2*M(1, i)* M(3, i)/n - b2*M(3, i));
    end    
    % Removed
    M(4, i+1) = M(4, i) + d * (b1 * M(2, i) + b2 * M(3, i));
end

% first location where more people in I2 than I1
ans = find(M(3, :) > M(2, :),1) * d;

if isvector(ans)
    if isempty(ans)
        ans = t_end * 1.5;
    end
end

%% Figure
% figure
% subplot(2,2,1);
% plot(M(1, :))
% title("Susceptible")
% 
% subplot(2,2,2);
% plot(M(2, :))
% title("Infection 1")
% 
% subplot(2,2,4);
% plot(M(3, :))
% title("Infection 2")
% 
% subplot(2,2,3);
% plot(M(4, :))
% title("Removed")