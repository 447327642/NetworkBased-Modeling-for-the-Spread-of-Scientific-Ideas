
function clust_coeff = step4a( mat )
% This function calculates the clustering coefficient of a network with
% Corresponding connectivity matrix: mat
% The approach used for calculation of clustering coeffient was the one which was proposed by Watts and Strogatz 
% in which the clustering coeffient of the whole network equals to the
% average of the local clustering coeefient of all nodes:
% D. J. Watts and Steven Strogatz (June 1998). "Collective dynamics of 'small-world' networks". Nature 393 (6684): 440�442. 
a=size(mat);
local_clust_coeff=zeros(1,a(1)); %%% the vector to store the local clustering coeffient of each node of the network
for i=1:a(1) %%% for each agent in the network
    x=find(mat(i,:)==1); %%% find all the neighbours of agent i
    count=0;
    l=length(x);
    if l>1
    for j=1:(l-1) %%% loop to investigate the neighbour relationship for all possible pairs among the neighbors of node i
        for k=(j+1):l
            if mat(x(j),x(k))==1
                count=count+1; % to count the number of neighbour relationships
            end
        end
    end
    norml=l*(l-1)/2; %% normalizing factor (i.e. the number of distinct pairs)
    local_clust_coeff(i)=count/norml; %% local clustering coefficient of node i
    else
    local_clust_coeff(i)=0;
    end
end
clust_coeff=sum(local_clust_coeff)/a(1); %% the average clustering coefficient of entire network
end


