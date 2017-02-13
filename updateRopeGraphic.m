function updateRopeGraphic( ropeX, ropeY )
%UPDATEROPEGRAPHIC Summary of this function goes here
%   Detailed explanation goes here

ax = gca; % Get axes object

cla % Clear axes

plot(ropeX, ropeY); % Plot the rope

ax.YLim = [-30,30];
ax.XLim = [-30,30];


end

