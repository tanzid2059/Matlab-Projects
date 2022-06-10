function [q,r,t]=leaveQueue(q,r,i)
    t=q(i);
    q(i)=[];
    r(i)=[];
end