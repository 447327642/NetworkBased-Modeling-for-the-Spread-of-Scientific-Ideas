function clust_coeff = step4a( mat )
% This function calculates the clustering coefficient of a network with
% corresponding connectivity matrix: mat
% The approach used for the calculation of the clustering coeffient was the one which was proposed by Watts and Strogatz 
% in which the clustering coefficient of the whole network equals the
% average of the local clustering coefficent of all nodes:
% D. J. Watts and Steven Strogatz (June 1998). "Collective dynamics of 'small-world' networks". Nature 393 (6684): 440-442. 
a=size(mat);
local_clust_coeff=zeros(1,a(1)); %%% The vector to store the local clustering coefficient of each node of the network
for i=1:a(1) %%% For each agent in the network
    x=find(mat(i,:)==1); %%% Find all the neighbours of agent i
    count=0;
    l=length(x);
    if l>1
    for j=1:(l-1) %%% Loop to investigate the neighbour relationship for all possible pairs among the neighbours of node i
        for k=(j+1):l
            if mat(x(j),x(k))==1
                count=count+1; % To count the number of neighbour relationships
            end
        end
    end
    norml=l*(l-1)/2; %% Normalizing factor (i.e., the number of distinct pairs)
    local_clust_coeff(i)=count/norml; %% Local clustering coefficient of node i
    else
    local_clust_coeff(i)=0;
    end
end
clust_coeff=sum(local_clust_coeff)/a(1); %% The average clustering coefficient of the entire network
end


