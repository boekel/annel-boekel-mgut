%% The basic model we refined
% Based on the model by Laguna, Abramson and Zanette
% MSSSM - HS13 - Opinion Convergence
% The Opinion Formers
%% Initialization
% number of agents
N = 200;
% number of iterations
iter = 2000;
% convergence parameter
c = 0.005;
% u in [0, 1]
u = 0.35;

% initialize matrix with vectors of opinions
M = zeros(N, iter);
% opinions at the beginning
M(:, 1) = rand(N, 1);

%% Calculation
half = N/2;
for t=1:iter-1
   % shuffle the rows of the matrix
   M = M(randperm(size(M,1)),:);
   % interactions
   for j=1:half
       if (abs(M(j, t) - M(j+half, t)) < u)
           M(j, t+1) = M(j, t) + c * (M(j+half, t) - M(j, t));
           M(j+half, t+1) = M(j+half, t) + c * (M(j, t) - M(j+half, t));
       else
           M(j, t+1) = M(j, t);
           M(j+half, t+1) = M(j+half, t);
       end
   end
end

%% Plot
for i=1:N-1
    plot(M(i, :))
    hold on
end
plot(M(N, :));
xlabel('Number Of Iterations');
ylabel('Opinion');
saveas(gcf, 'charisma_1', 'bmp');
seed = RandStream.getGlobalStream;
save('charisma', 'N', 'iter', 'c', 'u', 'M', 'gamma', 'seed');