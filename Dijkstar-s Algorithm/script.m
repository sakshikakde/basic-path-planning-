%The code is valid for a single convex shaped obstacle 
close all;clear all;clc;
%defining global variables as they will be needed inside the functions used
global hull_x_y;
global nodes;

%define obstacle shape and robot shape 
Obstacle=[10,12;5,4;2,7;3,8;10,12];
%Robot=[0,1;0.5,0.86;0.86,0.5;1,0;-1.14,-0.5;0.5,-0.86;0,-1;-0.5,-0.86;-0.86,-0.5;-1,0;-0.86,0.5;-0.5,0.86;0,1];
Robot=[1,1;1,-1;-1,-1;-1,1];

%getting configurational space
%get_configurational_space is a customised function
hull_x_y=get_configurational_space(Obstacle,Robot);

%define start node and end node
qs=[2,10];%start point
qd=[10,8];%destination

%plotting the map with obstacle
figure(1);
plot(qs(1,1),qs(1,2),'o',qd(1,1),qd(1,2),'o');hold on;
plot(hull_x_y(:,1),hull_x_y(:,2),'-r');hold on;title('Visiblity graph');axis equal;grid on;xlabel('x');ylabel('y');
fill(hull_x_y(:,1),hull_x_y(:,2),'r');grid on;axis equal;
%visiblity_graph;

%visualize;%visualises visiblity graphs on configurational space
hull_x_y(size(hull_x_y,1),:)=[];%to remove repeated points
nodes=[qs;hull_x_y;qd];
