function [mat, vec, dominant_freq, most_freq] = step2(t_end,phi,alpha,mat,vec,p,threshold)
%%%%%%%%%%%%%%%%%%%%%%%% step2: Runing the Simulation %%%%%%%%%%%%%%%%%%%%
%%% t_end: number of iterations
%%% phi:  network reorganization rate
%%% alpha: innovation rate
%%% mat: initial connectivity matrix
%%% vec: initial idea vector
%%% p: initial number of opinions
%%% then it outputs: 
%%% mat: connectivity matrix after simulation
%%% vec: idea vector after simulation
%%% dominant_ferq: the vector holding the frequency of dominant idea
%%% most_freq: the vector holding the index of dominating idea in each time

most_freq=zeros(1,t_end); %%% Vector for storing the index of the dominating idea in each time step.
dominant_freq=zeros(1,t_end); %%% Vector for storing the frequency of dominant idea in each time step. 

for t=1:t_end 
    x1=ceil(rand()*n); %%% choosing one person randomly for network reorganization or changing idea
    a1=rand();
    b1=phi;
    if a1<b1 %%% i.e with probability phi to reorganize the network
       v=find(mat(x1,:)==1 && vec~=vec(x1)); %%% defining the neighbours of x1 that do not have the same idea as x1
       x2=v(ceil(rand()*length(v))); %%% choosing one neighbour randomly to remove connection with
       mat(x1,x2)=0; %%% deletion of the edge between x1 and x2
       mat(x2,x1)=0; %%% deletion of the edge between x2 and x1
       ind=0;
       while (ind==0)
           similar_idea=find(vec==vec(x1)); %%% define the agents with the same idea
           x3=similar_idea(ceil(rand()*length(similar_idea))); %%% choose x3 randomly among the agents with the same idea with x1 as the newly connected agent to x1
           if mat(x3,x1)~=1  %%% to ensure x3 is not already a neighbour of x1// otherwise it iterates till finding the appropriate one
               ind=1;
           end
       end
       mat(x1,x3)=1; %%% formation of new edge between x1 and x3
       mat(x3,x1)=1; %%% formation of new edge between x3 and x1
    else  %%% otherwise change the idea of x1 to that of one that reaches the threshold
       v2=find(mat(x1,:)==1); %%% defining the neighbours of x1
       vv=vec(v2); %%% the corresponding ideas of the neighbours
       vvv=unique(vv); %%% vector of all the distinct ideas
       freq=zeros(1,length(vvv)); %%% vector for frequencies of the ideas
       for i=1:length(vvv) %%% to test for all distinct ideas
           if length(find(vv==vvv(i)))>(threshold*length(v2)) %%%whether the frequency is larger than the threshold [To include complex contagion definition]
               freq(i)=1;
           end
       end
       candidates=vvv(freq==1); %%% The ideas meeting the threshold 
       candidates_size=length(candidates); %%% The number of ideas meeting the threshold
       if candidates_size>0
           chosen=ceil(rand()*candidates_size);%%% Randomly choose one of the candidates
           vec(x1)=candidates(chosen);  %%% change the idea of x1 to the chosen idea 
       end
                              
       %x2=v(ceil(rand()*length(v))); %%% choosing one neighbour randomly to whose idea, the idea of x1 will be changed
       %vec(x1)=vec(x2); %%% change the idea of x1 to that of x2 
    end
    
    y=ceil(rand()*n); %%%choosing one person randomly for coming up with a new idea
    a2=rand();
    b2=alpha;
    if a2<b2 %%% i.e. with probability alpha to generate a novel idea
        bound=10^6; %%% to limit the index of new ideas to 10^6 which simulates nearly boundryless pool of ideas 
        new_idea=ceil(rand()*bound)+p; %%% the index of new idea
        vec(y)=new_idea; %%% changing the idea of agent y to the novel one
    end
    %%%%
    most_freq(t)=mode(vec); %%% the dominant idea at time t
    dominant_freq(t)=length(vec==most_freq); %%% the frequency of the dominant idea at time t
end  
end