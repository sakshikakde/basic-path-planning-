function [ans] = sub2d(A,B)
%subtracts rows present in 2D matrix B from 2D matrix A
%both must have same number of columns
if size(A,1)<size(B,1)
    error('Matrix dimension of matrix to be subtracted must be lesser.');
else
    for row=1:1:size(B,1)
       [~,Index]=ismember(A,B(row,:),'rows');
       [val index]=max(Index);
       A(index,:)=[];
    end
end
ans=A;
end

