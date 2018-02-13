function [hull_co_ordinates] = get_configurational_space(obstacle,robot )
%obstacle and robot co-ordinates as input arguments
%returns convex hull co-ordinates

%getting minkovaski sum from two sets of x and y co-ordinates
M=minkovaski_sum(obstacle,robot);
x=M(:,1);y=M(:,2);
figure(10);
plot(x,y,'o');grid on;axis equal;hold on;xlabel('x');ylabel('y');title('Convex Hull');
%convex hull
h=convhull(x,y);
x_hull=x(h);y_hull=y(h);
hull_co_ordinates=[x_hull,y_hull];
plot(x_hull,y_hull,'-r');
end

