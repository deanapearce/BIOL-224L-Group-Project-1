% Vector of time steps
t = 0:d:t_end;
% Number of total time points
n_t = floor(t_end / d);

% Create Susceptible pool, set value at time 0 to N - 1
S = zeros(1, n_t);
S(1,1) = n - 1;

% Create Infected 1 pool, set value at time 0 to 1
I1 = zeros(1, n_t);
I1(1,1) = 1;

% Create Infected 2 pool, set value at time at introduction to 1
I2 = zeros(1, n_t);
I1(1, (floor(t_intr / d))) = 1;

% Create Removed pool, value is 0 at first time step
R = zeros(1, n_t);

for i=1:n_t;
    S(1, i+1) = S(1, i) - d * S(1, i) / n * (a1*I1(1,i) + a2*I2(1,i))
    I1(1, i+1) = I1(1, i) + d * (a1*S(1, i) * I1(1, i) / n - b1 * I1(1, i))
    % TODO: strain 1 logic
    if t > t_intr
        I2(1, i+1) = I2(1, i) + d * (a2*S(1, i) * I2(1, i) / n - b2 * I2(1, i))
        % TODO: strain 2 logic
    end
    R(1, i+1) = R(1, i+1) + d* (b1 * I1(1, i) + b2 * I2(1, i))
end

plot(I1);