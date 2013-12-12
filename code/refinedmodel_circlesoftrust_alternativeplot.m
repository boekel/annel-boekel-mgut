%% Our model with the circles of trust
%  MSSSM - HS13 - Opinion Convergence
%  The Opinions Formers
%% Initialization
% resolution
N = 40;
% number of iterations
iter = 2000;
% convergence parameter
c = 0.002;
% u in [0, 1]
u = 1;

% initialize matrix with vectors of opinions
M = zeros(N*N, iter);
% opinions at the beginning
M(:, 1) = rand(N*N, 1);
% position matrices
P = zeros(N, N);
for a=1:N
    P(a, :) = linspace((a-1)*N+1, (a-1)*N+N, N);
end
pos = zeros(N*N, 2);
for b = 1:N*N
    pos(b, 1) = ((b-rem(b, N))/N)+1;
    pos(b, 2) = (rem(b, N));
end
pos = pos./N;
% vector for tracking the indeces
index = linspace(1, N*N, N*N);
% radius of/factor for "circles of trust" 
r1 = 0.1;
f1 = 3;
r2 = 0.3;
f2 = 1;
f = 0.75;
%% Calculation
for t=1:iter-1
   % shuffle the rows of the matrix
   newindex = randperm(size(M,1));
   M = M(newindex, :);
   index = index(newindex);
   % interactions
   % (we split the matrix in two halfs)
   half = (N*N)/2;
   for j=1:half
       if (abs(M(j, t) - M(j+half, t)) < u)
           f = 0.75;
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
hold on;
for e=1:N
    P(e, :) = M(index(P(e, :)), iter);    
end
view(0,90);
surf(1:N,1:N,P,'EdgeColor','none');
colorbar;
saveas(gcf, 'refinedmodel_circlesoftrust_alternativeplot_1', 'bmp');
seed = RandStream.getGlobalStream;
save('refinedmodel_circlesoftrust_alternativeplot', 'N', 'iter', 'c', 'u', 'M', 'pos', 'seed');