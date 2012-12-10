function [mat, vec, dominant_freq, most_freq] = step2(t_end,phi,alpha,mat,vec,p,threshold)
%%%%%%%%%%%%%%%%%%%%%%%% step2: Running the simulation %%%%%%%%%%%%%%%%%%%%
%%% t_end: number of iterations
%%% phi:  network reorganization rate (AKA rewiring)
%%% alpha: innovation rate
%%% mat: initial connectivity matrix
%%% vec: initial idea vector
%%% p: initial number of ideas
%%% Then it outputs: 
%%% mat: connectivity matrix after simulation
%%% vec: idea vector after simulation
%%% dominant_freq: the vector holding the frequency of the dominant idea
%%% most_freq: the vector holding the index of dominating idea in each time

most_freq=zeros(1,t_end); %%% Vector for storing the index of the dominating idea in each time step.
dominant_freq=zeros(1,t_end); %%% Vector for storing the frequency of dominant idea in each time step. 
a=size(mat);
n=a(1); %%% Number of agents

for t=1:t_end 
    x1=ceil(rand()*n); %%% Choosing one person randomly for network reorganization or changing idea
    a1=rand();
    b1=phi;
    if a1<b1 %%% I.e., with probability phi reorganize the network
       v00=find(mat(x1,:)==1); %%% Defining neighbours of x1
       v=find(vec(v00)~=vec(x1)); %%% Define neighbours of x1 that do not have the same idea as x1
       if ~isempty(v)
          x2=v(ceil(rand()*length(v))); %%% Choosing one neighbour with different idea randomly to remove connection with
          mat(x1,x2)=0; %%% Deletion of the edge between x1 and x2
          mat(x2,x1)=0; %%% Deletion of the edge between x2 and x1
          similar_idea=find(vec==vec(x1)); %%% Define the agents with the same idea as x1
          non_neighbor_sim_idea=setdiff(similar_idea,v00); %%% The agents with similar idea as x1 who are not neighbours of x1
          if ~isempty(non_neighbor_sim_idea)
              x3=non_neighbor_sim_idea(ceil(rand()*length(non_neighbor_sim_idea))); %%% Choose x3 randomly among the agents with the same idea and that is a non-neighbour of x1 as the newly connected agent to x
              mat(x1,x3)=1; %%% Formation of new edge between x1 and x3
              mat(x3,x1)=1; %%% Formation of new edge between x3 and x1
          else %%% We'll forget about network reorganization in this time by reforming the deleted edges.
              mat(x1,x2)=1; 
              mat(x2,x1)=1;
          end
       end
       
    else  %%% Otherwise change the idea of x1 to that of one of its randomly chosen neighbours
       v2=find(mat(x1,:)==1); %%% Defining the neighbours of x1
       if ~isempty(v2)
          vv=vec(v2); %%% The corresponding ideas of the neighbours
          vvv=unique(vv); %%% Vector of all the distinct ideas
          freq=zeros(1,length(vvv)); %%% Vector for the frequencies of the ideas
          for i=1:length(vvv) %%% To test for all distinct ideas
             if length(find(vv==vvv(i)))>(threshold*length(v2)) %%% Whether the frequency is larger than the threshold [to include complex contagion definition]
                freq(i)=1;
             end
          end
          candidates=vvv(find(freq==1)); %%% The ideas meeting the threshold 
          candidates_size=length(candidates); %%% The number of ideas meeting the threshold
          if candidates_size>0
             chosen=ceil(rand()*candidates_size);%%% Randomly choose one of the candidates
             vec(x1)=candidates(chosen);  %%% Change the idea of x1 to the chosen idea 
          end 
       end 
    end
    
    y=ceil(rand()*n); %%% Choosing one person randomly for coming up with a new idea
    a2=rand();
    b2=alpha;
    if a2<b2 %%% I.e., with probability alpha generate a novel idea
        bound=10^6; %%% To limit the index of new ideas to 10^6 which simulates nearly boundless pool of ideas 
        new_idea=ceil(rand()*bound)+p; %%% The index of the new idea
        vec(y)=new_idea; %%% Changing the idea of agent y to the novel one
    end
    %%%%
    most_freq(t)=mode(vec); %%% The dominant idea at time t
    dominant_freq(t)=length(find(vec==most_freq(t))); %%% The frequency of the dominant idea at time t
end  
end