function graph_diameter = step4e( mat,s,c )
%This function outputs the diameter of the graph 'mat'
%mat: connectivity matrix
%s: number of connected components
%c: the connected component vector
sp=sparse(mat);
max_path=zeros(1,s);  %%% vector storing diameter for each connected components.
for i=1:s %%% for each connected component
    x=find(c==i); %%% charachterizing the nodes which belong to the i-th connected component
    a=length(x); %%% the number of nodes in the i-th connected component
    path_length=zeros(1,(a*(a-1)/2)); %%% The vector storing the shortest path between each pairs of nodes belonging to the connected component i
    count=0;
    if a>1
    for k=1:(a-1)
        for j=(k+1):a
            count=count+1;
            path_length(count)=graphshortestpath(sp,x(k),x(j)); %%% the vector storing the shortest path between pairs k and j
        end
    end
    max_path(i)=max(path_length); %% the maximum shortest path for connected component i
    else
    max_path(i)=0;
    end
end
graph_diameter=max(max_path); %% the maximum shortest path for the hole network (Diameter of the network)
end


