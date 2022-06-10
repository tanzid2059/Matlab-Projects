function [q,x]=dequeue(q)
    x=q(1);
    q(1)=[];
end