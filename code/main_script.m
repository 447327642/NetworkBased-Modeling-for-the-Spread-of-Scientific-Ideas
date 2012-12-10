%% The first phase: Simulation to study the influence of network structure on the idea distribution%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% The following parameters will remain constant during this study,
%%% so we won't play with them %%%
n=1000; %% the number of agents %%%
m=40; %% initial number of clusters for caveman matrix%%%
p=40; %% initial number of ideas%%
t_end=1000; %%% number of iterations%%
%%% For the following parameters we'll run different simulations based on
%%% combinatorial complexity of the parameters%%%
phi_choices=[0.1,0.3,0.5]; %%% network reorganization rate (AKA rewiring)%%
alpha_choices=[0.01,0.05,0.10]; %%% innovation rate %%%
threshold_choices=[0.001,0.01,0.05];%%% threshold for complex contagion %%%


%%% A totally random idea distribution, independent of the connectivity
%%% matrix, so applicable for every network structure is defined for this
%%% phase %%%
vec1=zeros(1,n);
for i=1:n
    vec1(i)=ceil(rand()*p);
end 
    
for choice1=1:4
%% Step1: Definition of different initial matrices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%% For each simulation, we must choose one of the following connectivity matrices %%%%%%%%%%%%%%%%%%%%%%%
    switch choice1
        case 1 
         %%% option 1: Caveman Connectivity Matrix
         mat1=step1_caveman(n,m);
         s1='Caveman';
        case 2
        %%% option 2: Random Connectivity Matrix
        prob=0.025; %%% Probability of edge formation between any pair of edges
        mat1=step1_randomgraph(n,prob);
        s1='Random';
        case 3
        %%% option 3: Scale Free Connectivity Matrix
        m0=24; % Number of initially placed nodes
        m1=12; % Number of nodes a new added node is connected to, 1 <= m1 < m0
        mat1=step1_scalefree(n, m0, m1);
        s1='Scale_free';
        case 4
        %%% option 4: Small World Connectivity Matrix
        ka=24; %% Mean degree (assumed to be an even integer)
        beta=0.01; %% Rewiring probability
        mat1= step1_smallworld(n, ka, beta);
        s1='Small_world';
    end
 
    %% Step2: Simulation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for choice2=1:3
        phi=phi_choices(choice2);
        for choice3=1:3
            alpha=alpha_choices(choice3);
           for choice4=1:3
             threshold=threshold_choices(choice4);
             
             [mat2,vec2,dominant_freq,most_freq]=step2(t_end,phi,alpha,mat1,vec1,p,threshold); %%% Obtaining the final matrix and vector after running the simulation
             
             %%%% We need step4c here, since its outputs will be the input
             %%%% for step 3b
             %%%%%%% step4c: Number of connected components %%%%%%%%%%
             sp_mat2=sparse(mat2);
             [s,c]=graphconncomp(sp_mat2); %% matlab built in function 'Bioinformatics Toolbox'
             %%% s: number of connected components
             %%% c: vector which assigns each node to a connected component

             %% Step3: Results for influence of structure on idea distribution %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

             %%%%%%% step3a: Defining the average intra_idea neighbourhood index %%%%%%%
             neighbor_index=step3a(mat2,vec2);

             %%%%%%% step3b: Defining the average intra_idea distance %%%%%%%
             intra_idea_distance=step3b(mat2,vec2,s,c);

             %%%%%%% step3c: Frequency of dominant idea with respect to time %%%%%%%
             %%% is the third output of the step2 function (dominant_freq)%%%
             dominant_freq;

             %%%%%%% step3d: Fraction of novel ideas (novelty index) %%%%%%
             nov_index=(length(find(vec2>p)))/(length(vec2)); %%% Indicates the fraction of agents holding the newly generated ideas 

             %%%%%%% step3e: Defining the average dominance time (the average amount of time in which the dominating idea keeps its dominance over different dominance periods)
             average_dominance_time=step3e(most_freq);
             
             %%% Naming the file which saves the results
             s2=int2str(choice2);
             s3=int2str(choice3);
             s4=int2str(choice4);
             name=['phase1_',s1,'_',s2,'_',s3,'_',s4];
             save(name);
           end          
        end
    end
end

clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The second phase: Simulation to study the influence of idea distribution on the network structure%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% The following three parameters will remain constant during this study,
%%% so we won't play with them %%%
n=1000; %% the number of agents
m=40; %% initial number of clusters for caveman matrix
p=40; %% initial number of ideas
t_end=1000; %%% number of iterations%%
%%% For the following parameters we'll run different simulations based on
%%% combinatorial complexity of the parameters%%%
phi_choices=[0.1,0.3,0.5]; %%% network reorganization rate (AKA rewiring)%%
alpha_choices=[0.01,0.05,0.10]; %%% innovation rate %%%
threshold_choices=[0.001,0.01,0.05];%%% threshold for complex contagion %%%



%%%%% In this phase we'll keep the connectivity matrix constant, so we only use
%%%%% Caveman connectivity matrix %%%
mat1=step1_caveman(n,m);


for choice1=1:3
%% Step1: Definition of different initial idea vectors %%%%%%%%%%%%%%%%%%%%%%%
    switch choice1
           case 1
           %%%%%% option1: Random idea vector %%%%%%%
           %%% A totally random idea distribution, independent of the connectivity
           %%%% matrix, so applicable for every network structure
           vec1=zeros(1,n);
           for i=1:n
                vec1(i)=ceil(rand()*p);
           end
           s1='Random';
           case 2
           %%%%%% option2: Parallel idea vector %%%%%%%
           %%% This idea vector is applicable only for caveman connectivity matrix in
           %%% which all agents inside a cluster have the same idea
           vec1=zeros(1,n);
           for i=1:(m-1) %%% For each cluster
              for j=1:ceil(n/m)
                  vec1((i*ceil(n/m))+j)=i; %%% All agents will hold the i-th idea
              end
           end
           s1='Parallel';
           case 3
           %%%%%% option3: Antiparallel idea vector %%%%%%%
           %%% This idea vector is applicable only for caveman connectivity matrix in
           %%% which all agents inside a cluster have different ideas
           vec1=zeros(1,n);
           for i=1:(m-1) %%% For each cluster
               for j=1:ceil(n/m)
                  vec1((i*ceil(n/m))+j)=j; %%% All agents will hold different ideas
               end
           end
           s1='Antiparallel';
    end
    %% Step2: Simulation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for choice2=1:3
        phi=phi_choices(choice2);
        
        for choice3=1:3
            alpha=alpha_choices(choice3);
          for choice4=1:3 
            threshold=threshold_choices(choice4);
            
            [mat2,vec2,dominant_freq,most_freq]=step2(t_end,phi,alpha,mat1,vec1,p,threshold); %%% Obtaining the final matrix and vector after running the simulation


            %% Step3: Results for the influence of the idea distribution on the network structure %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            %%%%%%% step4a: Clustering coefficient of the final network %%%%%%%%
            clust_coefficient=step4a(mat2);

            %%%%%%% step4b: Degree distribution of the final network %%%%%%%%%%%
            [dgr,frq]=step4b(mat2);
            average_degree=sum(dgr.*frq)/sum(frq);

            %%%%%%% step4c: Number of connected components %%%%%%%%%%
            sp_mat2=sparse(mat2);
            [s,c]=graphconncomp(sp_mat2); %% Matlab built in function 'Bioinformatics Toolbox'
            %%% s: number of connected components
            %%% c: vector which assigns each node to a connected component

            %%%%%%% step4d: Average path length for the final network %%%%%%%%%%
            average_path_length = step4d( mat2,s,c );

            %%%%%%% step4e: Diameter of the network %%%%%%%%%%%%%%%%%%
            diam=step4e(mat2,s,c);
            
            %%% Naming and saving
            s2=int2str(choice2);
            s3=int2str(choice3);
            s4=int2str(choice4);
            name=['phase2_',s1,'_',s2,'_',s3,'_',s4];
            save(name);
          end
        end
    end
end

clear;

