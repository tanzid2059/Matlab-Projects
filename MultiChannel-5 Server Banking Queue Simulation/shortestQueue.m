function [a,b,c,d,e,r1,r2,r3,r4,r5]=shortestQueue(a,b,c,d,e,x,r1,r2,r3,r4,r5)
    la=length(a);lb=length(b);lc=length(c);ld=length(d);le=length(e);
    [M,t]=min([la,lb,lc,ld,le]);
    if(t==1)
        [a,r1]=enqueue(a,x,r1);
    elseif(t==2)
        [b,r2]=enqueue(b,x,r2);
    elseif(t==3)
        [c,r3]=enqueue(c,x,r3);
    elseif(t==4)
        [d,r4]=enqueue(d,x,r4);
    elseif(t==5)
        [e,r5]=enqueue(e,x,r5);    
    end
end