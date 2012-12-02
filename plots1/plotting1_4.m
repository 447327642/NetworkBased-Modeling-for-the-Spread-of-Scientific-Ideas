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

count=0;
for choice1=1:3
    switch choice1
        case 1
            s1='phi=0.1';
            m1='1';
        case 2
            s1='phi=0.3';
            m1='2';
        case 3
            s1='phi=0.5';
            m1='3';
    end
    
    for choice2=1:3
        switch choice2
            case 1
                s2='alpha=0.01';
                m2='1';
            case 2
                s2='alpha=0.05';
                m2='2';
            case 3
                s2='alpha=0.1';
                m2='3';
        end
            
        for choice3=1:3
            switch choice3
                case 1
                    s3='threshold=0.001';
                    m3='1';
                case 2
                    s3='threshold=0.01';
                    m3='2';
                case 3
                    s3='threshold=0.05';
                    m3='3';
            end
            count=count+1;
            line1=dom_freq(count,:);
            line2=dom_freq(27+count,:);
            line3=dom_freq(54+count,:);
            line4=dom_freq(81+count,:);
            f=figure();
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('time')
            ylabel('Frequency of the dominant idea')
            title(['The influence of network structure on the frequency of the dominant idea',' ',s1,' ',s2,' ',s3]);
            legend('Caveman Network','Random Network','Scale Free Network','Small World Network')
            name=(['Plotting1_Network Comparison_frequency_dominant_idea-',m1,'_',m2,'_',m3]);
            saveas(f,name);
        end
    end
end
            