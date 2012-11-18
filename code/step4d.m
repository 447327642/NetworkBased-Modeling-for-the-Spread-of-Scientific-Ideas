function average_path_length = step4d( mat,s,c )
%This function outputs the average path length for the graph
%mat: connectivity matrix
%s: number of connected components
%c: the connected component vector
av_p_l=zeros(1,s); %%% the vector which will store the average path length for each connected component of the 'mat' network
n=zeros(1,s); %%%  the vector which will store the number of nodes belonging to each connected component.

for i=1:s %%% for each connected component
    x=find(c==i); %%% charachterizing the nodes which belong to the i-th connected component
    a=length(x); %%% the number of nodes in the i-th connected component
    n(i)=a;
    compnt=mat(x,x); %%% focusing on the nodes belonging to the i-th connected component
    sp=sparse(compnt);
    count=0;
    for k=1:(a-1)
        for j=(k+1):a
        count=count+graphshortestpath(sp,k,j); %%% sum of the path length between all pairs of node
        end
    end
    norml=a*(a-1)/2; %%% normalization factor
    av_p_l(i)=count/norml; %%% average of path length
end
average_path_length=sum(av_p_l.*n)/sum(n); %%% weighted average path length
end