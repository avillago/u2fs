function fea = twomoons(N, minx, noise,ratio,r2)
% Generate two moons facing each other. inputs are the level of noise,
% number of points per moon, and the ratio

phi2 = rand(N/2,1) * pi;
fea = [minx + r2 * sin(phi2) - .5 * noise  + noise * rand(N/2,1) r2 * ratio * cos(phi2) - .5 * noise  + noise * rand(N/2,1) zeros(N/2,1)];
fea2 = -1.*fea(:,1:2);
fea2(:,1) = fea2(:,1) - 20*ones(size(fea2,1),1);
fea2(:,2) = fea2(:,2) - 20*ones(size(fea2,1),1);
fea2(:,3) = ones(size(fea2,1),1);

fea = [fea;fea2];
fea(:,1:2) = fea(:,1:2)+1.1*randn(size(fea,1),2);