%%%
neighbor_ind=zeros(1,108);
int_id_dis=zeros(1,108);
nov_ind=zeros(1,108);
av_dom_tim=zeros(1,108);
dom_freq=zeros(108,1000);
alpha=[0.01,0.05,0.1];
phi=[0.1,0.3,0.5];
threshold=[0.001,0.01,0.05];
count=0;

for i=1:4
    switch i
        case 1
        s1='Caveman';
        case 2
        s1='Random';
        case 3
        s1='Scale_free';
        case 4
        s1='Small_world';
    end
    for j=1:3
        s2=int2str(j);
        for k=1:3
            s3=int2str(k);
            for l=1:3
                count=count+1;
                s4=int2str(l);
                name=['phase1_',s1,'_',s2,'_',s3,'_',s4];
                a=load(name);
                neighbor_ind(count)=a.neighbor_index;
                int_id_dis(count)=a.intra_idea_distance;
                nov_ind(count)=a.nov_index;
                av_dom_tim(count)=a.average_dominance_time;
                dom_freq(count,:)=a.dominant_freq;
            end
        end
    end
end

%%%
for i=1:4
    switch i
        case 1
            f=figure();
            line1=neighbor_ind(1:27);
            line2=neighbor_ind(28:54);
            line3=neighbor_ind(55:81);
            line4=neighbor_ind(82:108);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Neighborhood index')
            title('The influence of network structure on neighborhood index');
            legend('Caveman Network','Random Network','Scale Free Network','Small World Network')
            name=('Plotting1_Network Comparison_Neighborhood_index');
            saveas(f,name);
        case 2
            f=figure();
            line1=int_id_dis(1:27);
            line2=int_id_dis(28:54);
            line3=int_id_dis(55:81);
            line4=int_id_dis(82:108);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Intra-idea distance')
            title('The influence of network structure on intra-idea distance')
            legend('Caveman Network','Random Network','Scale Free Network','Small World Network')
            name=('Plotting1_Network Comparison_intra_idea_distance');
            saveas(f,name);
        case 3
            f=figure();
            line1=nov_ind(1:27);
            line2=nov_ind(28:54);
            line3=nov_ind(55:81);
            line4=nov_ind(82:108);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Novelity Index')
            title('The influence of network structure on Novelity index')
            legend('Caveman Network','Random Network','Scale Free Network','Small World Network')
            name=('Plotting1_Network Comparison_intra_novelity_index');
            saveas(f,name);
        case 4
            f=figure();
            line1=av_dom_tim(1:27);
            line2=av_dom_tim(28:54);
            line3=av_dom_tim(55:81);
            line4=av_dom_tim(82:108);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Average Dominance Time')
            title('The influence of network structure on Average Dominance Time')
            legend('Caveman Network','Random Network','Scale Free Network','Small World Network')
            name=('Plotting1_Network Comparison_Average Dominance Time');
            saveas(f,name);
    end
end
            