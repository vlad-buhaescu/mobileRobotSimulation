function  plot_environment(handl,objects,x_max,y_max,varargin)

 axis([0 x_max 0 y_max]); %axis(world_dim);
 
  set(handl,'Box','on');


switch nargin
    case 4
        %do nothing (obstacles already plotted)
    case 5  %argument C (cells) - plot cell decomposition
        disp('acesta este varargin');
        C=varargin{1}
        %represent cells:
        for i=1:length(C)
            fill(C{i}(1,:),C{i}(2,:),'w','FaceAlpha',0.5);
        end
        
        %write cell number
        for i=1:length(C)
            centr=mean(C{i},2)';
            text(centr(1),centr(2),sprintf('c_{%d}',i),'HorizontalAlignment','center','Color','k','FontSize',10,'FontAngle','italic','FontName','TimesNewRoman');
        end
        set(gca,'Box','on','XTick',[],'YTick',[]);
        
    case 6 %arguments C (cells) and adjacency - plot adjacency graph and cell decomposition
        C=varargin{1};
        adj=varargin{2};
        %represent cells:
        for i=1:length(C)
            fill(C{i}(1,:),C{i}(2,:),'w','FaceAlpha',0.5);
        end

        centr=zeros(length(C),2);   %store centroids
        for i=1:length(C)
            centr(i,:)=mean(C{i},2)';
        end
        gplot(adj,centr,':b');  %represent adjacency graph

        %write cell number
        for i=1:length(C)
            text(centr(i,1),centr(i,2),sprintf('c_{%d}',i),'HorizontalAlignment','center','Color','k','FontSize',10,'FontAngle','italic','FontName','TimesNewRoman');
        end
        set(gca,'Box','on','XTick',[],'YTick',[]);
        
    case 8  %arguments C,adj,middle_X,middle_Y - do not represent adjacency graph
        C=varargin{1};
        adj=varargin{2};
        middle_X=varargin{3};
        middle_Y=varargin{4};
        %represent cells:
        for i=1:length(C)
            fill(C{i}(1,:),C{i}(2,:),'w','FaceAlpha',0.5);
        end

        centr=zeros(length(C),2);   %store centroids
        for i=1:length(C)
            centr(i,:)=mean(C{i},2)';
        end
%         gplot(adj,centr,':b');  %represent adjacency graph

        for i=1:length(C)
            for j=setdiff(find(adj(i,:)),1:i)
                plot(middle_X(i,j),middle_Y(i,j),'*r');
            end
        end
        %write cell number
        for i=1:length(C)
            text(centr(i,1),centr(i,2),sprintf('c_{%d}',i),'HorizontalAlignment','center','Color','k','FontSize',10,'FontAngle','italic','FontName','TimesNewRoman');
        end
        set(gca,'Box','on','XTick',[],'YTick',[]);
        
    otherwise
        fprintf('\nCheck # of arguments for the plot_environment function\n');
end

for i=1:length(objects)   
    fill(objects{i}(1,:),objects{i}(2,:),'r'); 
    centr=mean(objects{i},2)';
    axis([0 x_max 0 y_max]); %axis(world_dim);
    set(handl,'Box','on');
    text(fix(centr(1)) ,fix( centr(2)) ,sprintf('O_{%d}',i),'HorizontalAlignment','center','Color','g','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
 
end
 