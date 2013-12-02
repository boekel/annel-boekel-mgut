%% Unsere Erweiterung mit dem Charisma-Faktor und dem Abstand
%  19.11.2013 15:40
%  Lukas
%% Initialization
% number of agents
N = 1000;
% number of iterations
iter = 1000;
% convergence parameter
c = 0.004;
% u in [0, 1]
u = 0.35;

% initialize matrix with vectors of opinions
M = zeros(N, iter);
% opinions at the beginning
M(:, 1) = rand(N, 1);
% initialize charisma
gamma = rand(N, 1);
% initialize position
pos = rand(N, 2);
% radius of/factor for "circles of trust" (bloeder Name?)
r1 = 0.2;
f1 = 1.5;
r2 = 0.4;
f2 = 1.25;
f = 1;
%% Calculation
for t=1:iter-1
   % shuffle the rows of the matrix
   newindex = randperm(size(M,1));
   M = M(newindex, :);
   gamma = gamma(newindex);
   pos = pos(newindex, :);
   % interactions
   % (we split the matrix in two halfs)
   half = N/2;
   for j=1:half
       if (abs(M(j, t) - M(j+half, t)) < u)
           f = 1;
           if (norm((pos(j, :)-pos(j+half, :)), 2) < r2)
               f = f2;
               if (norm((pos(j, :)-pos(j+half, :)), 2) < r1)
                   f = f1;
               end
           end
           delta = f*c*(((gamma(j+half))\(gamma(j)+gamma(j+half)))*M(j+half, t) - ((gamma(j))\(gamma(j)+gamma(j+half)))*M(j,t));
           M(j, t+1) = M(j, t) + delta;
           M(j+half, t+1) = M(j+half, t) - delta;
       else
           M(j, t+1) = M(j, t);
           M(j+half, t+1) = M(j+half, t);
       end
   end
end

%% Plot
% for i=1:N-1
    % plot(M(i, :))
    % hold on
% end
% plot(M(N, :));
plot3(pos(:, 1), pos(:, 2), M(:, iter), '.');