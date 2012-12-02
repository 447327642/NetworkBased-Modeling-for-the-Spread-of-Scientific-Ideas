%%%%
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


%%%%
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
            line1=dgr{count};
            mine1=frq{count};
            line2=dgr{27+count};
            mine2=frq{27+count};
            line3=dgr{54+count};
            mine3=frq{54+count};         
            f=figure();
            loglog(line1,mine1,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,mine2,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5)
            hold on
            plot(line3,mine3,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Log(degree)')
            ylabel('Log(frequency)')
            title(['The influence of idea distribution on the degree distribution',' ',s1,' ',s2,' ',s3]);
            legend('Random distribution','Parallel distribution','Antiparallel distribution')
            name=(['Plotting2_idea_comparison_degree_distribution-',m1,'_',m2,'_',m3]);
            saveas(f,name);
        end
    end
end
