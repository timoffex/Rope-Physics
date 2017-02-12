function updateRopeGraphic( ropeX, ropeY )
%UPDATEROPEGRAPHIC Summary of this function goes here
%   Detailed explanation goes here

ax = gca; % Get axes object

cla % Clear axes

plot(ropeX, ropeY); % Plot the rope

ax.YLim = [-10,10];
ax.XLim = [-10,10];


end

