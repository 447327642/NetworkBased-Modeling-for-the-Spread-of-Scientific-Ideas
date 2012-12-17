%%%%%%%%%%%%%%%%%%% Plots of phase 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Extracting information from the saved Mat files %%%%%%%
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

f=figure();

%%% phase diagrams for each parameter pairs for the results of the effects
%%% of idea distribution on network structure.

for i=1:3
    switch i
        case 1
        s1='Random';
        val=0;
        case 2
        s1='Parallel';
        val=27;
        case 3
        s1='Antiparallel';
        val=54;
    end
    for j=1:4
        switch j
        case 1
        s2='Clusteing Coefficient';
        main_vec=clust_coefficient;
        case 2
        s2='Number of connected components';
        main_vec=s;
        case 3
        s2='Average path length';
        main_vec=average_path_length;
        case 4
        s2='Network diameter';
        main_vec=diam;
        end
        for k=1:3
             switch k
             case 1
             s3='(alpha:phi)';
             x=0:0.5:1;
             xl='alpha';
             y=0:0.5:1;
             yl='phi';
             for l=1:3
                 M=[main_vec(val+l),main_vec(val+l+9),main_vec(val+l+18)
                     ;main_vec(val+l+3),main_vec(val+l+12),
                     main_vec(val+l+21)
                     ;main_vec(val+l+6),main_vec(val+l+15),
                     main_vec(val+l+24)];
                 %
                 [xlab,ylab]=meshgrid(x,y);
                 hold on;
                 view(0,90);
                 surf(xlab,ylab,M,'EdgeColor','none');
                 colorbar;
                 set(gca,'FontSize',14)
                 xlabel(xl);
                 ylabel(yl);
                 switch l
                     case 1
                         s5='first';
                     case 2
                         s5='second';
                     case 3
                         s5='third';
                 end
                 name2=['phase diagram of ',s2,' for alpha versus phi',
                     ' and','the', s5,' threshold','obtained for',s1,
                     'idea distribution'];
                 title(name2); 
                 name=['Plotting2_','Pdiag_',s1,'_',s2,'_',s3,'_',s4,
                     'AND','the', s5,' threshold'];
                 saveas(f,name);
                 hold off
                 %
             end
             case 2
             s3='(alpha:threshold)';
             x=0:0.5:1;
             xl='alpha';
             y=0:0.5:1;
             yl='threshold';             
             for l=1:3
                 M=[main_vec(val+9*(l-1)+1),main_vec(val+9*(l-1)+2),
                     main_vec(val+9*(l-1)+3);main_vec(val+9*(l-1)+4),
                     main_vec(val+9*(l-1)+5),main_vec(val+9*(l-1)+6);
                     main_vec(val+9*(l-1)+7),main_vec(val+9*(l-1)+8),
                     main_vec(val+9*(l-1)+9)];
                 %
                 [xlab,ylab]=meshgrid(x,y);
                 hold on;
                 view(0,90);
                 surf(xlab,ylab,M,'EdgeColor','none');
                 colorbar;
                 set(gca,'FontSize',14)
                 xlabel(xl);
                 ylabel(yl);
                  switch l
                     case 1
                         s5='first';
                     case 2
                         s5='second';
                     case 3
                         s5='third';
                 end
                 name2=['phase diagram of ',s2,' for alpha versus
                     threshold',
                     ' and','the', s5,' phi','obtained for',s1,
                     'idea distribution'];
                 title(name2);
                 name=['Plotting2_','Pdiag_',s1,'_',s2,'_',s3,'_',s4,
                     ' and','the', s5,' phi'];
                 saveas(f,name);
                 hold off
                 %
             end
             
             case 3
             s3='(phi:threshold)';
             x=0:0.5:1;
             xl='phi';
             y=0:0.5:1;
             yl='threshold';             
             for l=1:3
                 M=[main_vec(val+3*(l-1)+1),main_vec(val+3*(l-1)+2),
                     main_vec(val+3*(l-1)+3);main_vec(val+3*(l-1)+10),
                     main_vec(val+3*(l-1)+11),main_vec(val+3*(l-1)+12);
                     main_vec(val+3*(l-1)+19),main_vec(val+3*(l-1)+20),
                     main_vec(val+3*(l-1)+21)];
                 %
                 [xlab,ylab]=meshgrid(x,y);
                 hold on;
                 view(0,90);
                 surf(xlab,ylab,M,'EdgeColor','none');
                 colorbar;
                 set(gca,'FontSize',14)
                 xlabel(xl);
                 ylabel(yl);
                  switch l
                     case 1
                         s5='first';
                     case 2
                         s5='second';
                     case 3
                         s5='third';
                 end
                 name2=['phase diagram of ',s2,' for phi versus threshold',
                     ' and','the', s5,' threshold','obtained for',s1,
                     'idea distribution'];
                 title(name2);
                 name=['Plotting2_','Pdiag_',s1,'_',s2,'_',s3,'_',s4,
                     ' and','the', s5,' threshold'];
                 saveas(f,name);
                 hold off
                 %
             end
             end
        end
    end
end

%%% Dependence of the property of each network to the parameters 

for i=1:3
    
    switch i
        case 1
        s1='Random';
        val=0;
        case 2
        s1='Parallel';
        val=27;
        case 3
        s1='Antiparallel';
        val=54;
    end
    
    for j=1:4
        switch j
        case 1
        s2='clust_coefficient';
        main_vec=clust_coefficient;
        case 2
        s2='s';
        main_vec=s;
        case 3
        s2='average_path_length';
        main_vec=average_path_length;
        case 4
        s2='diam';
        main_vec=diam;
        end
        for k=1:3
            switch k
                case 1
                    s3='threshold';
                    f=figure();
                    for l=1:3
                        line=main_vec(3*(0:8)+val+l);
                        set(gca,'FontSize',14)
                        xlabel('Different pairs of alpha and phi values');
                        ylabel(s2);
                        namek=['Dependence of',' ',s2,' ','on',' ',s3,' ',
                            'for',' ',s1,' ','idea distribution'];
                        title(namek);
                        
                        switch l
                            case 1
                                 plot(line,'--ks','LineWidth',2,
                                 'MarkerEdgeColor','k','MarkerFaceColor',
                                 'k','MarkerSize',5)
                                 hold on
                            case 2
                                 plot(line,'--bs','LineWidth',2,
                                 'MarkerEdgeColor','b','MarkerFaceColor',
                                 'b','MarkerSize',5)
                                 hold on
                            case 3
                                 plot(line,'--rs','LineWidth',2,
                                 'MarkerEdgeColor','r','MarkerFaceColor',
                                 'r','MarkerSize',5)
                        end
                        legend('threshold=0.001','threshold=0.01',
                        'threshold=0.05')
                        name=['plotting1_',s1,'_',s2,'_',
                            'threshold_sensitivity'];
                        saveas(f,name);
                    end                  
                           
                case 2
                    s3='alpha';
                    f=figure();
                    for l=1:3
                        line=main_vec([1,2,3,10,11,12,19,20,21]+val+3*(l-1)
                        );
                        set(gca,'FontSize',14)
                        xlabel('Different pairs of threshold and phi values
                        ');
                        ylabel(s2);
                        namek=['Dependence of',' ',s2,' ','on',' ',s3,' ',
                            'for',' ',s1,' ','idea distribution'];
                        title(namek);
                        
                        switch l
                            case 1
                                 plot(line,'--ks','LineWidth',2,
                                 'MarkerEdgeColor','k','MarkerFaceColor',
                                 'k','MarkerSize',5)
                                 hold on
                            case 2
                                 plot(line,'--bs','LineWidth',2,
                                 'MarkerEdgeColor','b','MarkerFaceColor',
                                 'b','MarkerSize',5)
                                 hold on
                            case 3
                                 plot(line,'--rs','LineWidth',2,
                                 'MarkerEdgeColor','r','MarkerFaceColor',
                                 'r','MarkerSize',5)
                        end
                        legend('alpha=0.01','alpha=0.05','alpha=0.10')
                        name=['plotting1_',s1,'_',s2,'_','alpha_sensitivity
                            '];
                        saveas(f,name);
                    end
                    
                case 3
                    s3='phi';
                    f=figure();
                    for l=1:3
                        line=main_vec((1:9)+val+9*(l-1));
                        set(gca,'FontSize',14)
                        xlabel('Different pairs of threshold and alpha 
                        values');
                        ylabel(s2);
                         namek=['Dependence of',' ',s2,' ','on',' ',s3,' 
                             ','for',' ',s1,' ','idea distribution'];
                        title(namek);
                       
                        switch l
                            case 1
                                 plot(line,'--ks','LineWidth',2,
                                 'MarkerEdgeColor','k','MarkerFaceColor',
                                 'k','MarkerSize',5)
                                 hold on
                            case 2
                                 plot(line,'--bs','LineWidth',2,
                                 'MarkerEdgeColor','b','MarkerFaceColor',
                                 'b','MarkerSize',5)
                                 hold on
                            case 3
                                 plot(line,'--rs','LineWidth',2,
                                 'MarkerEdgeColor','r','MarkerFaceColor',
                                 'r','MarkerSize',5)
                        end
                        legend('phi=0.1','phi=0.3','phi=0.5')
                        name=['plotting1_',s1,'_',s2,'_','phi_sensitivity'];
                        saveas(f,name);
                    end
            end
        end
    end
end


%%%%%%%% generating plots for each features of network structure for each
%%%%%%%% parameter sets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:4
    switch i
        case 1
            f=figure();
            line1=clust_coefficient(1:27);
            line2=clust_coefficient(28:54);
            line3=clust_coefficient(55:81);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g',
            'MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Clustering Coefficient')
            title('The influence of idea distribution on clustering 
            coefficient');
            legend('Random distribution','Parallel distribution',
            'Antiparallel distribution')
            name=('Plotting2_idea_Comparison_clustcoeff');
            saveas(f,name);
        case 2
            f=figure();
            line1=s(1:27);
            line2=s(28:54);
            line3=s(55:81);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g',
            'MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Number of connected components')
            title('The influence of idea distribution on the number of 
            connected components')
            legend('Random distribution','Parallel distribution',
            'Antiparallel distribution')
            name=('Plotting2_idea_Comparison_conncmp');
            saveas(f,name);
        case 3
            f=figure();
            line1=average_path_length(1:27);
            line2=average_path_length(28:54);
            line3=average_path_length(55:81);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g',
            'MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('average path length')
            title('The influence of idea distribution on average path length')
            legend('Random distribution','Parallel distribution',
            'Antiparallel distribution')
            name=('Plotting2_idea_Comparison_average_path_length');
            saveas(f,name);
        case 4
            f=figure();
            line1=diam(1:27);
            line2=diam(28:54);
            line3=diam(55:81);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g',
            'MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Network Diameter')
            title('The influence of idea distribution on Network Diameter')
            legend('Random distribution','Parallel distribution',
            'Antiparallel distribution')
            name=('Plotting2_idea_Comparison_diam');
            saveas(f,name);
    end
end

%%%%%%%%% plots for degree distribution resulting from different idea
%%%%%%%%% distribution
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
            mine1=frq{count}/1000;
            line2=dgr{27+count};
            mine2=frq{27+count};
            line3=dgr{54+count};
            mine3=frq{54+count};         
            f=figure();
            loglog(line1,mine1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,mine2,'--rs','LineWidth',2,'MarkerEdgeColor','r',
            'MarkerFaceColor','r','MarkerSize',5)
            hold on
            plot(line3,mine3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Log(degree)')
            ylabel('Log(frequency)')
            title(['The influence of idea distribution on the degree 
                distribution',' ',s1,' ',s2,' ',s3]);
            legend('Random distribution','Parallel distribution',
            'Antiparallel distribution')
            name=(['Plotting2_idea_comparison_degree_distribution-'
                ,m1,'_',m2,'_',m3]);
            saveas(f,name);
        end
    end
end

