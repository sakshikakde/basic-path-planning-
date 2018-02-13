%% Construct route from start to dest by following the parent links
zero=[0,0];
if (isinf(distance_update(size(distance_update,1))))
    route = [];
else
    route = [qd];
    for j=1:1:size(nodes,1)
        if all(nodes(j,:)==qd)
           row_n=j;
        end
    end
    Distance=distance_actual(row_n)
    %parent
 
    while all(parent(row_n,:)~=0)
        route = [parent(row_n,:); route];
        for k=1:1:size(parent,1)
           if all(nodes(k,:)==parent(row_n,:))
             row_n=k;
             break;
           end
        end
    end
    route = [qs ; route];
end

plot(route(:,1),route(:,2),'LineWidth',2);
    
 