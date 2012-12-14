function cave_mat = step1_caveman(n,m)
%%%%%%%%%%%%  This function outputs a Caveman Matrix  %%%%%%%%%%%%%%%%%%
%%% n: the number of agents
%%% m: initial number of clusters
%%% p: initial maximum index of opinions
cave_mat=zeros(n,n); %Caveman Matrix

for i=1:n
    x=ceil(i/(n/m));
    for j=1:n
        y=ceil(j/(n/m));
        if x==y
            if i~=j
            cave_mat(i,j)=1; %definition of intracluster edges
            end
        end
    end
end
%%% x1 and x2 for each cluster represent the two agents who interact with
%%% nearby clusters%%
x1=zeros(1,m);
x2=zeros(1,m);
for i=1:m
    x1(i)=ceil(rand()*(n/m)+(n/m)*(i-1));
    ind=0;
    while(ind==0) %% This loop is used to prevent x1 and x2 to make the same numbers
        x2(i)=ceil(rand()*(n/m)+(n/m)*(i-1));
        if x2(i)~=x1(i)
            ind=1;
        end
    end
end
%%% definition of intercluster edges 
for i=1:(m-1)
    cave_mat(x2(i),x1(i+1))=1;
    cave_mat(x1(i+1),x2(i))=1;
end
cave_mat(x1(1),x2(m))=1;
cave_mat(x2(m),x1(1))=1;
end