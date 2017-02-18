function updateRopeGraphic( ropeX, ropeY, totalLength )
%UPDATEROPEGRAPHIC Summary of this function goes here
%   Detailed explanation goes here

ax = gca; % Get axes object

cla % Clear axes

plot(ropeX, ropeY); % Plot the rope


ax.YLim = [-totalLength,totalLength];
ax.XLim = [-totalLength,totalLength];


end

