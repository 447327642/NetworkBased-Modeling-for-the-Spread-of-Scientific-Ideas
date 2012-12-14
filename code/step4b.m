function [dgr,frq] = step4b(mat)
%%% This function returns the degree vector (dgr) and its corresponding
%%% frequency vector (frq) from the connectivity matrix (mat). In other words,
%%% first the degree of all nodes in the network will be calculated and
%%% then the set of unique degrees will be stored in the dgr vector and the
%%% corresponding frequency will be stored in vector frq. For example,
%%% degree x will be stored in the i-th element of the dgr vector, then the number of nodes whose degree equals x 
%%% will be calculated and will be stored in the i-th element of vector frq.
a=size(mat);
degr=zeros(1,a(1)); %%% The vector which stores the degree of each node of the network
for i=1:a(1)
    degr(i)=sum(mat(i,:)); %%% Degree for each node 
end
dgr=unique(degr); %%% Set of unique degrees of the nodes of the network
frq=zeros(1,length(dgr)); %%% The corresponding frequency vector
for j=1:length(dgr)
    frq(j)=length(find(degr==dgr(j))); %%% frq(j) is the number of nodes in the network whose degree equals to dgr(j)
end

end