function objects = define_regions(x_max,y_max)

world_dim=[0; x_max;0 ;y_max]
% disp('Definirea unor regiuni convexe (minim 3 varfuri) folosind mouse-ul');
obs_no=input('Number of regions: ');

fprintf('\nFor defining a region:\n\t - left-click = pick a vertex\n\t - right-click = pick last vertex\nRegions should be convex and non-overlapping\n\nPress any key to begin.\n')
pause();

% scrsz = get(0,'ScreenSize'); %rezolutia display-ului (pt a maximiza figurile)
% scrsz(4)=scrsz(4)-72; %inaltimea meniului figurii este 72 pixeli (asa mi-a iesit din calcul)

init_wrld_h=figure(); %handle al figurii cu lumea initiala
% set(init_wrld_h,'Position',scrsz); %maximizam figura
axis(world_dim);
% title('Obstacle vertices')
hold on
grid
%read obstacle's vertices
for i=1:obs_no   %i = object number
    j=1; %j = no. of vertexes for current object
    but=1;
    while but==1
        [x,y,but]=ginput(1);
%                 x=round(x*2)/2;
%                 y=round(y*2)/2;
        plot(x,y,'.k')
        objects{i}(:,j)=[x;y];
        j=j+1;
    end
    
    %creating convex obstacles & drawing them
    k=convhull(objects{i}(1,:),objects{i}(2,:));
    objects{i}=objects{i}(:,k(1:length(k)-1));
    pause(0.3)
    fill(objects{i}(1,:),objects{i}(2,:),'k','FaceAlpha',0.5); %or functia patch (similara cu fill)
end
