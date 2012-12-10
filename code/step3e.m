function [ average_dominance_time ] = step3e( most_freq )
%%%%% This function calculates the average dominance time for the dominating idea during the simulation
%%%%% most_freq: is the vector obtained from the simulation which holds the index of dominating ideas for each time step of the simulation
%%%%% It outputs the average_time which is the average of the dominance time for different dominance periods 
temp=zeros(1,length(most_freq)); %%% A temporary array which will hold the dominating period for the dominating idea
count=1; %%% Is the number of consecutive time steps in which an idea is considered as dominating
ind=0; %%% Is the index of domination period 
for i=2:length(most_freq)
    if most_freq(i)==most_freq(i-1)  
        count=count+1; %%% The number of consecutive steps is counted
    else
        ind=ind+1; %%% As soon as another domination period gets started the index of domination period adds by one
        temp(ind)=count; %%% The number of consecutive steps will be stored in the ind-th index of temp 
        count=0; %%% And count will be reset to zero to count the duration of the new domination period.
    end
end

if ind==0 %%% In the case that during the simulation just one special idea remains dominating forever
    ind=ind+1;
    temp(ind)=count; 
end

%%% From ind-th element until the end the temp vector will remain zero we define a new vector as follows to store the corresponding non-zero elements of temp 
final=zeros(1,ind);
for j=1:ind
    final(j)=temp(j);
end
average_dominance_time=mean(final);
end


