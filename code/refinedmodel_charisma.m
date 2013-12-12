%% Our model with the charisma factor
%  MSSSM - HS13 - Opinion Convergence
%  The Opinions Formers
%% Initialization
% number of agents
N = 200;
% number of iterations
iter = 2000;
% convergence parameter
c = 0.002;
% u in [0, 1]
u = 0.35;

% initialize matrix with vectors of opinions
M = zeros(N, iter);
% opinions at the beginning
M(:, 1) = rand(N, 1);
% initialize charisma
gamma = rand(N, 1);

%% Calculation
for t=1:iter-1
   % shuffle the rows of the matrix
   newindex = randperm(size(M,1));
   M = M(newindex,:);
   gamma = gamma(newindex);
   % interactions
   % (we split the matrix in two halfs)
   half = N/2;
   for j=1:half
       if (abs(M(j, t) - M(j+half, t)) < u)
           delta = c*(M(j+half, t) - M(j,t));
           M(j, t+1) = M(j, t) + delta*((2*gamma(j+half))/(gamma(j)+gamma(j+half)));
           M(j+half, t+1) = M(j+half, t) - delta*((2*gamma(j))/(gamma(j)+gamma(j+half)));
       else
           M(j, t+1) = M(j, t);
           M(j+half, t+1) = M(j+half, t);
       end
   end
end

%% Plot
% title('');
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