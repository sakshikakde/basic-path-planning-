function [M_sum] =minkovaski_sum(Obstacle,Robot)
%calcilates minkovaski sum of the given two sets
% Input arguments are the co-ordinate of the obstacle (O)and co-ordinates of
% robot (R) with CoG of robot at origin(0,0).
k=1;
for i=1:1:size(Obstacle,1)
    for j=1:1:size(Robot,1)
       M_sum(k,:)=Obstacle(i,:)+Robot(j,:);
       k=k+1;
    end
end
end

