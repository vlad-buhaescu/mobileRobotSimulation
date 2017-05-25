function ph = plotfilledcircle(circle_radius,circlecenter, fcol)
%
% plotfilledcircle(circle_radius,circlecenter, fcol) 
%
% Function to plot a filled circle with radius 'circle_radius'
% 'circlecenter' ... center location [0 0] is default
% 'fcol' is optional and defines the face color (black default)
% 
% Armin H 2011
if nargin < 2
 circlecenter = [0 0];
end
if nargin < 3
 fcol = [0 0 0]; 
end
theta = linspace(0,2*pi,100); % 100 points between 0 and 2pi
x = circle_radius*cos(theta) + circlecenter(1);
y = circle_radius*sin(theta) + circlecenter(2);
ph = fill(x, y, 'k');
set(ph, 'FaceColor', fcol);
box off; axis equal;
end