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
                        namek=['Dependence of',' ',s2,' ','on',' ',s3,' ','for',' ',s1,' ','idea distribution'];
                        title(namek);
                        
                        switch l
                            case 1
                                 plot(line,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
                                 hold on
                            case 2
                                 plot(line,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
                                 hold on
                            case 3
                                 plot(line,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5)
                        end
                        legend('threshold=0.001','threshold=0.01','threshold=0.05')
                        name=['plotting1_',s1,'_',s2,'_','threshold_sensitivity'];
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
                        namek=['Dependence of',' ',s2,' ','on',' ',s3,' ','for',' ',s1,' ','idea distribution'];
                        title(namek);
                        
                        switch l
                            case 1
                                 plot(line,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
                                 hold on
                            case 2
                                 plot(line,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
                                 hold on
                            case 3
                                 plot(line,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5)
                        end
                        legend('alpha=0.01','alpha=0.05','alpha=0.10')
                        name=['plotting1_',s1,'_',s2,'_','alpha_sensitivity'];
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
                         namek=['Dependence of',' ',s2,' ','on',' ',s3,' ','for',' ',s1,' ','idea distribution'];
                        title(namek);
                       
                        switch l
                            case 1
                                 plot(line,'--ks','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5)
                                 hold on
                            case 2
                                 plot(line,'--bs','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5)
                                 hold on
                            case 3
                                 plot(line,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5)
                        end
                        legend('phi=0.1','phi=0.3','phi=0.5')
                        name=['plotting1_',s1,'_',s2,'_','phi_sensitivity'];
                        saveas(f,name);
                    end
            end
        end
    end
end

                    

