function [q,r]=enqueue(q,x,r)
    i=length(q);
    q(i+1)=x;
    r(i+1)=randi([5 10]);
end