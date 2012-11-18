function [ average_dominance_time ] = step3e( most_freq )
%%%%% this function calculates the average of dominance time for the dominating idea during the simulation
%%%%% most_freq: is the vector obtained from simulation which holds the index of dominating ideas for each time steps of the simulation
%%%%% it outputs the average_time which is the average of the dominance time for different dominance periods 
temp=zeros(1,length(most_freq)); %%% a temporary array which will hold the dominating period for dominating idea
count=0; %%% is the number of consecutive time steps in which an idea is considered as dominating
ind=0; %%% is the index of domination period 
for i=2:length(most_freq)
    if most_freq(i)==most_freq(i-1)  
        count=count+1; %%% the number of consecutive steps is conted
    else
        ind=ind+1; %%% as soon as another domination period gets tarted the index of domination period adds by one
        temp(ind)=count; %%% the number of consecutive steps will be stored in the ind-th index of tmp 
        count=0; %%% and count will be reset to zero to count the duration of the new domination period.
    end
end
%%% from ind-th element till end the temp vector will remain zero we define a new vector as follows to store the corresponding non-zero elements of temp 
final=zeros(1,ind);
for j=1:ind
    final(j)=temp(j);
end
average_dominance_time=mean(final);
end


