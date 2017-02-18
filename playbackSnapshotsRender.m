
% Play back!
totalLength = sum(segmentLength);

disp('Beginning playback!');
for i = 1:size(thetaSnapshots, 1),
    updateRopeGraphic([0 X(i,:)], [0 Y(i,:)], totalLength);
    pause(deltaT);
end