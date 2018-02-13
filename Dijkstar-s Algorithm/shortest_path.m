%run script.m befor running this file
%nodes are known
distance_update=inf(size(nodes,1),1);
distance_actual=inf(size(nodes,1),1);
distance_update(1)=0; %starting node
distance_actual(1)=0; %starting node
parent=zeros(size(nodes,1),2);

while true
    [min_dist, current_pointer] = min(distance_update(:));
    current=nodes(current_pointer,:);

    if (current(1,1)==qd(1,1)) && (current(1,2)==qd(1,2))
        break;
    end
    distance_update(current_pointer)=inf;
    visible_nodes=get_visible_nodes(current);
    
    %calculating distance
    for i=1:1:size(visible_nodes,1)
      if (parent(current_pointer,1)~= visible_nodes(i,1)) && (parent(current_pointer,2)~= visible_nodes(i,2))
        dist=sqrt((visible_nodes(i,2)-current(1,2))^2+(visible_nodes(i,1)-current(1,1))^2);
           for j=1:1:size(nodes,1)
              if (visible_nodes(i,1)==nodes(j,1)) && (visible_nodes(i,2)==nodes(j,2))
                 row=j;
              end
           end
           if distance_actual(row)>=(dist+min_dist)
              distance_update(row)=dist+min_dist;
              distance_actual(row)=dist+min_dist;
              parent(row,:)=current;
           end
       end
end
end
     

