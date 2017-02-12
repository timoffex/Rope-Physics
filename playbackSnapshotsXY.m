
% Play back!
disp('Beginning playback!');
for i = 1:10:size(thetaSnapshots, 1),
    updateRopeGraphic([0 X(i,:)], [0 Y(i,:)]);
    pause(deltaT);
end