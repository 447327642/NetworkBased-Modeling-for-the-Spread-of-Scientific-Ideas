%%%%%%%%%%%%%%%%%%% Plots of phase 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Extracting information from the saved Mat files %%%%%%%
neighbor_ind=zeros(1,108);
int_id_dis=zeros(1,108);
nov_ind=zeros(1,108);
av_dom_tim=zeros(1,108);
dom_freq=zeros(108,1000);
alpha=[0.01,0.05,0.1];
phi=[0.1,0.3,0.5];
threshold=[0.001,0.01,0.05];
count=0;
 f=figure();
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

%%% phase diagrams for each parameter pairs for the results of the effects
%%% of network structure on idea distribution.

for i=1:4
    switch i
        case 1
        s1='Caveman';
        val=0;
        case 2
        s1='Random';
        val=27;
        case 3
        s1='Scale free';
        val=54;
        case 4
        s1='Small world';
        val=81;
    end
    for j=1:4
        switch j
        case 1
        s2='neighbor index';
        main_vec=neighbor_ind;
        case 2
        s2='intra idea distance';
        main_vec=int_id_dis;
        case 3
        s2='nov index';
        main_vec=nov_ind;
        case 4
        s2='average dominance time';
        main_vec=av_dom_tim;
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
                 M=[main_vec(val+l),main_vec(val+l+9),main_vec(val+l+18);
                     main_vec(val+l+3),main_vec(val+l+12),main_vec(val+l+21
                 );main_vec(val+l+6),main_vec(val+l+15),main_vec(val+l+24)];
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
                 name2=['phase diagram of ',s2,' for alpha versus phi',' 
                     and','the', s5,' threshold','obtained for',s1,'network
                     structure'];
                 title(name2); 
                 name=['plotting1_','Pdiag_',s1,'_',s2,'_',s3,'_',s4,
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
                 name2=['phase diagram of ',s2,' for alpha versus threshold
                     ',' and','the', s5,' phi','obtained for',s1,'network 
                     structure'];
                 title(name2);
                 name=['plotting1_','Pdiag_',s1,'_',s2,'_',s3,'_',s4,'
                     and','the', s5,' phi'];
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
                 name2=['phase diagram of ',s2,' for phi versus threshold'
                     ,' and','the', s5,' threshold','obtained for',s1,
                     'network structure'];
                 title(name2);
                 name=['plotting1_','Pdiag_',s1,'_',s2,'_',s3,'_',s4,
                     ' and','the', s5,' threshold'];
                 saveas(f,name);
                 hold off
                 %
             end
             end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Dependence of the property of each network to the parameters 

for i=1:4
    switch i
        case 1
        s1='Caveman';
        val=0;
        case 2
        s1='Random';
        val=27;
        case 3
        s1='Scale free';
        val=54;
        case 4
        s1='Small world';
        val=81;
    end
    for j=1:4
        switch j
        case 1
        s2='neighborhood index';
        main_vec=neighbor_ind;
        case 2
        s2='intra idea distance';
        main_vec=int_id_dis;
        case 3
        s2='novelity index';
        main_vec=nov_ind;
        case 4
        s2='average dominance time';
        main_vec=av_dom_tim;
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
                        namek=['Dependence of',' ',s2,' ','on',' ',s3,' 
                            ','for',' ',s1,' ','network structure'];
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
                        line=main_vec([1,2,3,10,11,12,19,20,21]+val+3*(l-1));
                        set(gca,'FontSize',14)
                        xlabel('Different pairs of threshold and phi values');
                        ylabel(s2);
                        namek=['Dependence of',' ',s2,' ','on',' ',s3,' ',
                            'for',' ',s1,' ','network structure'];
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
                        name=['plotting1_',s1,'_',s2,'_',
                            'alpha_sensitivity'];
                        saveas(f,name);
                    end
                    
                case 3
                    s3='phi';
                    f=figure();
                    for l=1:3
                        line=main_vec((1:9)+val+9*(l-1));
                        set(gca,'FontSize',14)
                        xlabel('Different pairs of threshold and alpha values');
                        ylabel(s2);
                         namek=['Dependence of',' ',s2,' ','on',' ',s3,' ',
                             'for',' ',s1,' ','network structure'];
                        title(namek);
                       
                        switch l
                            case 1
                                 plot(line,'--ks','LineWidth',2,
                                 'MarkerEdgeColor','k',
                                 'MarkerFaceColor','k','MarkerSize',5)
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Plotting each network feature for each set of
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:4
    switch i
        case 1
            f=figure();
            line1=neighbor_ind(1:27);
            line2=neighbor_ind(28:54);
            line3=neighbor_ind(55:81);
            line4=neighbor_ind(82:108);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g',
            'MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r',
            'MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Neighborhood index')
            title('The influence of network structure on neighborhood 
            index');
            legend('Caveman Network','Random Network','Scale Free Network',
            'Small World Network')
            name=('Plotting1_Network Comparison_Neighborhood_index');
            saveas(f,name);
        case 2
            f=figure();
            line1=int_id_dis(1:27);
            line2=int_id_dis(28:54);
            line3=int_id_dis(55:81);
            line4=int_id_dis(82:108);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g',
            'MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r',
            'MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Intra-idea distance')
            title('The influence of network structure on intra-idea distance')
            legend('Caveman Network','Random Network','Scale Free Network',
            'Small World Network')
            name=('Plotting1_Network Comparison_intra_idea_distance');
            saveas(f,name);
        case 3
            f=figure();
            line1=nov_ind(1:27);
            line2=nov_ind(28:54);
            line3=nov_ind(55:81);
            line4=nov_ind(82:108);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g',
            'MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r',
            'MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Novelity Index')
            title('The influence of network structure on Novelity index')
            legend('Caveman Network','Random Network','Scale Free Network',
            'Small World Network')
            name=('Plotting1_Network Comparison_intra_novelity_index');
            saveas(f,name);
        case 4
            f=figure();
            line1=av_dom_tim(1:27);
            line2=av_dom_tim(28:54);
            line3=av_dom_tim(55:81);
            line4=av_dom_tim(82:108);
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g',
            'MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r',
            'MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('Different triplets of alpha ,phi and threshold values')
            ylabel('Average Dominance Time')
            title('The influence of network structure on Average Dominance
            Time')
            legend('Caveman Network','Random Network','Scale Free Network',
            'Small World Network')
            name=('Plotting1_Network Comparison_Average Dominance Time');
            saveas(f,name);
    end
end
            

%%%%%%%%%%%%%%%%%%%% plotting frequency of dominant idea over time for each
%%%%%%%%%%%%%%%%%%%% parameter sets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
            plot(line1,'--ks','LineWidth',2,'MarkerEdgeColor','k',
            'MarkerFaceColor','k','MarkerSize',5)
            hold on
            plot(line2,'--gs','LineWidth',2,'MarkerEdgeColor','g',
            'MarkerFaceColor','g','MarkerSize',5)
            hold on
            plot(line3,'--bs','LineWidth',2,'MarkerEdgeColor','b',
            'MarkerFaceColor','b','MarkerSize',5)
            hold on
            plot(line4,'--rs','LineWidth',2,'MarkerEdgeColor','r',
            'MarkerFaceColor','r','MarkerSize',5)
            set(gca,'FontSize',14)
            xlabel('time')
            ylabel('Frequency of the dominant idea')
            title(['The influence of network structure on the frequency 
                of the dominant idea',' ',s1,' ',s2,' ',s3]);
            legend('Caveman Network','Random Network','Scale Free Network'
            ,'Small World Network')
            name=(['Plotting1_Network Comparison_frequency_dominant_idea-
                ',m1,'_',m2,'_',m3]);
            saveas(f,name);
        end
    end
end
     