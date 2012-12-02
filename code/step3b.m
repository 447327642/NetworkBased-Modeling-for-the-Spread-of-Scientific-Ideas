function intra_idea_distance = step3b(mat,vec,s,c)
%%%%%%%%%%%% step3b: Defining the average of the average shortest distance between agents holding the same idea %%%%%%%%%%%%%%
%%% mat: adjacency matrix
%%% vec: idea vector
%%% s: number of connected components
%%% c:  vector which assigns each node to a connected component
%%% and it outputs the average of average intra_distance between agents
%%% holding the same idea %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
unq=unique(vec); %%% collection of distinct ideas
mean_sum=zeros(1,length(unq)); %%% initializing the vector for storing the average distance between agents holding a particular idea
n=zeros(1,length(unq)); %%% initializing the corresponding vector for storing the number of agents holding a certain idea
mats=sparse(mat);

for i=1:length(unq)
    x=find(vec==unq(i));  %%% defining the set of agents holding the idea unq(i)       
    n(i)=length(x); %%% number of agents holding the idea unq(i)
    nn=zeros(1,s); %%% initializing the vector which will store the number of agents holding the idea unq(i) who belong to the m-th connected component
    mean_sum0=zeros(1,s);%%% initializing the vector which stores the mean of the distances between agents holding the idea unq(i) who belong to each distinct connected component
    for m=1:s %%% for each connected component
        y=x(find(c(x)==m)); %%% the set of agents holding the idea unq(i) who belong to the m-th connected component
        nn(m)=length(y); %%% number of agents holding the idea unq(i) who belong to the m-th connected component
        sum0=0;
        if nn(m)>1
           for j=1:(nn(m)-1)
               for k=(j+1):nn(m)
                   dis=graphshortestpath(mats,y(j),y(k)); %%% distance of each agent with similar idea from agent j inside the group [needs the bioinformatics toolbox to be installed]
                   sum0=sum0+dis; %%% sum of the distances between agents holding the idea unq(i) who belong to m-th connected component
               end
           end
           norml0=nn(m)*(nn(m)-1)/2; %%% normalizing factor
           mean_sum0(m)=sum0/norml0; %%% The avarage intra_idea distance  between agents holding the idea unq(i) who belong to the m-th connected component
        else
           mean_sum0(m)=0; 
        end        
    end
    
    if n(i)>1
       mean_sum(i)=(sum(mean_sum0.*nn))/(sum(nn)); %%% The avarage intra_idea distance  between agents holding the idea unq(i) 
    else
       mean_sum(i)=0;
    end
end

intra_idea_distance=(sum(mean_sum.*n))/(sum(n)); %%% The avarage intra_idea distance for the whole network
end