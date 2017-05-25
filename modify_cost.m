function cost = modify_cost(C,adj,mid_X,mid_Y,flag)

cost=sparse(size(adj,1),size(adj,2));
eps_cost=1e-3;  %a small cost, added to all costs (useful for avoiding zero-costs at self-loops)

switch flag
    case 1, %cost for going from cell i to cell j equals with distance between centroids of the two cells, plus eps_cost
        for i=1:(size(adj,1)-1) %symmetric cost matrix
            for j=i+find(adj(i,(i+1):end))  %higher-index neighbors
                cost(i,j)=norm(mean(C{i},2)-mean(C{j},2))+eps_cost;
                cost(j,i)=cost(i,j);
            end
            cost(i,i)=eps_cost; %self-loop
        end
        cost(end,end)=eps_cost; %self-loop
        
    case 2, %cost for going from cell i to cell j equals with distance between centroid of i and middle point of line segment shared by i and j
        for i=1:size(adj,1) %asymmetric cost matrix
            for j=setdiff(find(adj(i,:)),i)
                cost(i,j)=norm(mean(C{i},2)-[mid_X(i,j);mid_Y(i,j)])+eps_cost;
            end
            cost(i,i)=eps_cost; %self-loop
        end
        
    otherwise, %cost for going from cell i to cell j equals with the avegare distance from possible entry points in i (from other cell than j) to exit point from i (midpoint of line segment shared by i and j)
        for i=1:size(adj,1) %asymmetric cost matrix
            cost_exit=0;    %cost for exiting i (mean of possible traveled distances, if i is entered and left (rougher approx. for initial or final cell)
            neigh=setdiff(find(adj(i,:)),i);    %neighbors of i (different than i)
            for j=neigh %cell to compute cost to
                for k=setdiff(neigh,j);    %every possible entry neighbor to i
                    cost_exit=cost_exit+norm([mid_X(i,k);mid_Y(i,k)]-[mid_X(i,j);mid_Y(i,j)]);  %add distance from entry to exit
                end
                if cost_exit>0 %there were other neighbors than j
                    cost(i,j)=cost_exit/(length(neigh)-1)+eps_cost;  %average cost (j was not included in cost_exit)
                else    %no other neighbor than j
                    cost(i,j)=norm(mean(C{i},2)-[mid_X(i,j);mid_Y(i,j)])+eps_cost;   %distance from centroid of i
                end
            end
            cost(i,i)=eps_cost; %self-loop
        end
        
end
