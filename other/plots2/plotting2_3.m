%%%
%%%
clust_coefficient=zeros(1,81);
s=zeros(1,81);
average_path_length=zeros(1,81);
diam=zeros(1,81);
dgr=cell(1,81);
frq=cell(1,81);
alpha=[0.01,0.05,0.1];
phi=[0.1,0.3,0.5];
threshold=[0.001,0.01,0.05];

count=0;

for i=1:3
    switch i
        case 1
        s1='Random';
        case 2
        s1='Parallel';
        case 3
        s1='Antiparallel';
    end
    for j=1:3
        s2=int2str(j);
        for k=1:3
            s3=int2str(k);
            for l=1:3
                count=count+1;
                s4=int2str(l);
                name=['phase2_',s1,'_',s2,'_',s3,'_',s4];
                a=load(name);
                clust_coefficient(count)=a.clust_coefficient;
                s(count)=a.s;
                average_path_length(count)=a.average_path_length;
                diam(count)=a.diam;
                dgr{1,count}=a.dgr;
                frq{1,count}=a.frq;
            end
        end
    end
end


%%%

for i=1:4
    switch i
        case 1
            f=figure();
            line1=clust_coefficient(1:27);
            line2=clust_coefficient(28:54);
            line3=clust_coefficient(55:81);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Clustering Coefficient')
            title('The influence of idea distribution on clustering coefficient');
            legend('Random distribution','Parallel distribution','Antiparallel distribution')
            name=('Plotting2_idea_Comparison_clustcoeff');
            saveas(f,name);
        case 2
            f=figure();
            line1=s(1:27);
            line2=s(28:54);
            line3=s(55:81);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Number of connected components')
            title('The influence of idea distribution on the number of connected components')
            legend('Random distribution','Parallel distribution','Antiparallel distribution')
            name=('Plotting2_idea_Comparison_conncmp');
            saveas(f,name);
        case 3
            f=figure();
            line1=average_path_length(1:27);
            line2=average_path_length(28:54);
            line3=average_path_length(55:81);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('average path length')
            title('The influence of idea distribution on average path length')
            legend('Random distribution','Parallel distribution','Antiparallel distribution')
            name=('Plotting2_idea_Comparison_average_path_length');
            saveas(f,name);
        case 4
            f=figure();
            line1=diam(1:27);
            line2=diam(28:54);
            line3=diam(55:81);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Network Diameter')
            title('The influence of idea distribution on Network Diameter')
            legend('Random distribution','Parallel distribution','Antiparallel distribution')
            name=('Plotting2_idea_Comparison_diam');
            saveas(f,name);
    end
end
