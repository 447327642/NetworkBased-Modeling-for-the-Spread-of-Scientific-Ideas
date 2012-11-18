function graph_diameter = step4e( mat,s,c )
%This function outputs the diameter of the graph 'mat'
%mat: connectivity matrix
%s: number of connected components
%c: the connected component vector
max_path=zeros(1,s);  %%% vector storing diameter for each connected components.
for i=1:s %%% for each connected component
    x=find(c==i); %%% charachterizing the nodes which belong to the i-th connected component
    a=length(x); %%% the number of nodes in the i-th connected component
    compnt=mat(x,x); %%% focusing on the nodes belonging to the i-th connected component
    sp=sparse(compnt);
    path_length=zeros(1,(a*(a-1)/2)); %%% The vector storing the shortest path between each pairs of nodes belonging to the connected component i
    count=0;
    for k=1:(a-1)
        for j=(k+1):a
            count=count+1;
            path_length(count)=graphshortestpath(sp,k,j); %%% the vector storing the shortest path between pairs k and j
        end
    end
    max_path(i)=max(path_length); %% the maximum shortest path for connected component i
end
graph_diameter=max(max_path); %% the maximum shortest path for the hole network (Diameter of the network)
end
