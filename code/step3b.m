function intra_idea_distance = step3b(mat,vec)
%%%%%%%%%%%% step3b: Defining the average of the average shortest distance between agents holding the same idea %%%%%%%%%%%%%%
%%% mat: adjacency matrix
%%% vec: idea vector
%%% and it outputs the average of average intra_distance between agents
%%% holding the same idea %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
unq=unique(vec); %%% collection of distinct ideas
dd=zeros(1,length(unq)); %%% initializing the vector for storing the average distance between agents holding a particular idea
n=zeros(1,length(unq)); %%% initializing the corresponding vector for storing the number of agents holding a certain idea
mats=sparse(mat);
for i=1:length(unq)
    x=find(vec==unq(i));  %%% defining the set of agents holding the idea u(i)
    n(i)=length(x); %%% number of agents holding the idea 
    sum1=0;
    for j=1:n(i)
        for k=(j+1):n(i)
            dis=graphshortestpath(mats,x(j),x(k)); %%% distance of each agent with similar idea from agent j inside the group [needs the bioinformatics toolbox to be installed]
            sum1=sum1+dis; %%% sum of the distances
        end
    end
    if n(i)>1
       norml=n(i)*(n(i)-1)/2; %%% The number of distinct pairs inside the group of the agents with the same idea
       dd(i)=sum1/norml; %%% average intra_idea distance for idea i
    else
       dd(i)=0;
    end
end

intra_idea_distance=(sum(dd.*n))/(sum(n)); %%% The avarage intra_idea distance for the whole network
end