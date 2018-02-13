function [v_nodes] = get_visible_nodes(current)
%returns the nodes visible for the input node[X,Y]
%returns a matrix in form [X,Y]
global nodes
global hull_x_y;
start=current;
v_nodes=[];
for i=1:1:size(nodes,1)
    %for lines with angle not equal to 0 and 90 deg
   if ((nodes(i,1)~= current(1,1))&&(nodes(i,2)~= current(1,2)))
       coef=polyfit([nodes(i,1),start(1,1)],[nodes(i,2),current(1,2)],1);%equation of line
       m=coef(1);c=coef(2);%slope and y-intercept
       x=linspace(nodes(i,1),start(1,1),20);%20 points between two points
       y=m*x+c;%20 y co-otdinates
   %for lines with angle 90 deg
   elseif (nodes(i,1)==start(1,1))
       x=linspace(nodes(i,1),start(1,1),20);%20 points between two points
       y=linspace(nodes(i,2),start(1,2),20);%20 y co-otdinates
   %for lines with angle 0 deg
   elseif (nodes(i,2)==start(1,2))
       x=linspace(nodes(i,1),start(1,1),20);%20 points between two points
       y=linspace(nodes(i,2),start(1,2),20);%20 y co-otdinates
   end
   
   %check if points lie in or on the polygon with edges defined by hull_x_y
   [in1,on1]=inpolygon(x,y,hull_x_y(:,1),hull_x_y(:,2));
   check=(in1(2:(size(x,2)-2))==1) & (on1(2:(size(x,2)-2))==0);
   if any(check)~=1
      v_nodes=[nodes(i,:);v_nodes];
   end
end
%v_nodes contains the current node itsel.Hence subtract it
v_nodes=sub2d(v_nodes,start);
end

       




