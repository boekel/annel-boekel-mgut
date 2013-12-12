%% Our model with the circles of trust
%  MSSSM - HS13 - Opinion Convergence
%  The Opinions Formers
%% Initialization
% number of agents
N = 200;
% number of iterations
iter = 2000;
% convergence parameter
c = 0.004;
% u in [0, 1]
u = 1;

% initialize matrix with vectors of opinions
M = zeros(N, iter);
% opinions at the beginning
M(:, 1) = rand(N, 1);
% initialize position
pos = rand(N, 2);
% radius of/factor for "circles of trust"
r1 = 0.2;
f1 = 1;
r2 = 0.4;
f2 = 0.75;
f = 0.25;
%% Calculation
for t=1:iter-1
   % shuffle the rows of the matrix
   newindex = randperm(size(M,1));
   M = M(newindex, :);
   pos = pos(newindex, :);
   % interactions
   % (we split the matrix in two halfs)
   half = N/2;
   for j=1:half
       if (abs(M(j, t) - M(j+half, t)) < u)
           f = 0.25;
           if (norm((pos(j, :)-pos(j+half, :)), 2) < r2)
               f = f2;
               if (norm((pos(j, :)-pos(j+half, :)), 2) < r1)
                   f = f1;
               end
           end
           M(j, t+1) = M(j, t) + f * c * (M(j+half, t) - M(j, t));
           M(j+half, t+1) = M(j+half, t) + f * c * (M(j, t) - M(j+half, t));
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
saveas(gcf, 'circlesoftrust_1', 'bmp');
xlabel('Number Of Iterations');
ylabel('Opinion');
seed = RandStream.getGlobalStream;
save('circlesoftrust', 'N', 'iter', 'c', 'u', 'M', 'pos', 'seed');