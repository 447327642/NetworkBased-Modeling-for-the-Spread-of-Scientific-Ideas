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

%%% phase diagram for each parameter pairs

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
                 M=[main_vec(val+l),main_vec(val+l+9),main_vec(val+l+18);main_vec(val+l+3),main_vec(val+l+12),main_vec(val+l+21);main_vec(val+l+6),main_vec(val+l+15),main_vec(val+l+24)];
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
                 name2=['phase diagram of ',s2,' for alpha versus phi',' and','the', s5,' threshold','obtained for',s1,'network structure'];
                 title(name2); 
                 name=['plotting1_','Pdiag_',s1,'_',s2,'_',s3,'_',s4,'AND','the', s5,' threshold'];
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
                 M=[main_vec(val+9*(l-1)+1),main_vec(val+9*(l-1)+2),main_vec(val+9*(l-1)+3);main_vec(val+9*(l-1)+4),main_vec(val+9*(l-1)+5),main_vec(val+9*(l-1)+6);main_vec(val+9*(l-1)+7),main_vec(val+9*(l-1)+8),main_vec(val+9*(l-1)+9)];
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
                 name2=['phase diagram of ',s2,' for alpha versus threshold',' and','the', s5,' phi','obtained for',s1,'network structure'];
                 title(name2);
                 name=['plotting1_','Pdiag_',s1,'_',s2,'_',s3,'_',s4,' and','the', s5,' phi'];
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
                 M=[main_vec(val+3*(l-1)+1),main_vec(val+3*(l-1)+2),main_vec(val+3*(l-1)+3);main_vec(val+3*(l-1)+10),main_vec(val+3*(l-1)+11),main_vec(val+3*(l-1)+12);main_vec(val+3*(l-1)+19),main_vec(val+3*(l-1)+20),main_vec(val+3*(l-1)+21)];
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
                 name2=['phase diagram of ',s2,' for phi versus threshold',' and','the', s5,' threshold','obtained for',s1,'network structure'];
                 title(name2);
                 name=['plotting1_','Pdiag_',s1,'_',s2,'_',s3,'_',s4,' and','the', s5,' threshold'];
                 saveas(f,name);
                 hold off
                 %
             end
             end
        end
    end
end
