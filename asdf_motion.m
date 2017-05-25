%% create data for our animation: a dot moving along a path
% Our aim is to make a circle move around an image along a specified path.
% First, we'll create that path (xpos and ypos)
revolution_no = 5; % how often around the circle
ang_resolution = 40; % how many points (i.e. frames) per circle
da = 2*pi/ang_resolution; % delta angle
t = 0:da:revolution_no*2*pi; % time steps
% why not a spiral:
pathradius = linspace(0,10,length(t)); % path radius increases each dt
xpos = pathradius.*cos(t);
ypos = pathradius.*sin(t);
% show what we have so far:
figure(1);
subplot(1,3,1:2)
plot(t,xpos, '-k'); hold on;
plot(t,ypos, '-r');
set(gca, 'XLim', [0 max(t)]); box off;
xlabel('time steps'); ylabel('x (black) and y (red) pos')
subplot(1,3,3)
plot(xpos,ypos,'k'); axis equal; axis off;
title('The path our circle will move along');
% We now want to use these x-y coordinates to place a cirle on an image.
% Each iteration, we want the position to be updated so that it appears as
% if the circle moved around the specified path.
% In addition, we want the circle diameter to change as it goes along.
circlesize = linspace(0.2,2, length(t)); % circle size increases linearly

%% Test the moving circle 
% We'll now plot a circle for each time steps, according to the path and
% size specifications above. I created a separate function to create the
% circle, called 'plotfilledcircle'. 
axlim = 15; 
figure;
for c = 1:length(t)
 ph=plotfilledcircle(circlesize(c), [xpos(c) ypos(c)]);
% we need to set the axes to an appropriate limit, otherwise they'll
% resize to always show the full circle:
 axis([-axlim axlim -axlim axlim]); 
 axis square;
% create a counter that updates each iteration:
 titlestr = sprintf('Frame: %03d', c);
 title(titlestr);
 pause(0.05); % pause a bit to see animation
end
