function n_index = step3a(mat,vec)
%%%%%%% step3a: Defining the neighbourhood index between similar ideas %%%%%%%
%%% mat: adjacency matrix
%%% vec: idea vector
%%% it outputs: n_index which is the average neighbour index of the network
u=unique(vec); %%% Collection of distinct ideas
w=zeros(1,length(u)); %%% Initializing the vector for storing the neighbourhood index for each distinct idea
s=zeros(1,length(u)); %%% Initializing the vector for storing the number of agents holding each distinct idea
for i=1:length(u)
    x=find(vec==u(i));  %%% Defining the set of agents holding the idea u(i)
    s(i)=length(x);
    if s(i)>1
    sum1=0; %%% Number of agents with idea i which are in direct neighbourhood
    for k=1:(s(i)-1) %%% These two for loops are used to test the neighborhoods of all distinct pairs
        for j=(k+1):s(i)
            if mat(x(k),x(j))==1 %%% To check if they are neighbours
                sum1=sum1+1;
            end
        end
    end
    max_neighbors=(s(i)*(s(i)-1)/2); %%% Normalizing factor (i.e., the maximum number of pairs of distinct agents)
    w(i)=sum1/max_neighbors; %%% Neighborhood index for idea 'i'
    else
        w(i)=0;
    end
end
norml=sum(s); %%% Normalizing factor
count=sum(w.*s); %%% The weighted sum of neighborhood index   
n_index=count/norml; %%% Average neighbour index of the whole network
end