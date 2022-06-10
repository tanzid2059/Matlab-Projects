function [q1,q2,q3,q4,q5,r1,r2,r3,r4,r5,count,tdelay]=renege(clock,q1,q2,q3,q4,q5,r1,r2,r3,r4,r5)
    
    count=0;
    tdelay=0;
    size=length(q1);
    i=1;
    while i<=size
        r=r1(i)*60;
        t=clock-q1(i);
        
        if(t>r)
            m=t-r;
            if(m>=240)
                [q1,r1]=leaveQueue(q1,r1,i);
                count=count+1;
                tdelay=tdelay+m;
                disp('someone from q1 left after 4min');
                size=size-1;
                continue;
            elseif(m>=180)
                if(randi([2 3])==3)
                    [q1,r1]=leaveQueue(q1,r1,i);
                    size=size-1;
                    count=count+1;
                    tdelay=tdelay+m;
                    disp('someone from q1 left after 3min');
                    continue;
                end
            elseif(m>=120)
                if(randi([1 4])==2)
                    [q1,r1]=leaveQueue(q1,r1,i);
                    count=count+1;
                    tdelay=tdelay+m;
                    size=size-1;
                    disp('someone from q1 left after 2min');
                    continue;
                end
            end
        end
        i=i+1;
    end
    
    
    
    size=length(q2);
    i=1;
    while i<=size
        r=r2(i)*60;
        t=clock-q2(i);
        
        if(t>r)
            m=t-r;
            if(m>=240)
                [q2,r2]=leaveQueue(q2,r2,i);
                disp('someone from q2 left after 4min');
                count=count+1;
                tdelay=tdelay+m;
                size=size-1;
                continue;
            elseif(m>=180)
                if(randi([2 3])==3)
                    [q2,r2]=leaveQueue(q2,r2,i);
                    count=count+1;
                    tdelay=tdelay+m;
                    size=size-1;
                    disp('someone from q2 left after 3min');
                    continue;
                end
            elseif(m>=120)
                if(randi([1 4])==2)
                    [q2,r2]=leaveQueue(q2,r2,i);
                    size=size-1;
                    count=count+1;
                    tdelay=tdelay+m;
                    disp('someone from q2 left after 2min');
                    continue;
                end
            end
        end
        i=i+1;
    end
    
    
    
    size=length(q3);
    i=1;
    while i<=size
        r=r3(i)*60;
        t=clock-q3(i);
        
        if(t>r)
            m=t-r;
            if(m>=240)
                [q3,r3]=leaveQueue(q3,r3,i);
                disp('someone from q3 left after 4min');
                count=count+1;
                tdelay=tdelay+m;
                size=size-1;
                continue;
            elseif(m>=180)
                if(randi([2 3])==3)
                    [q3,r3]=leaveQueue(q3,r3,i);
                    count=count+1;
                    tdelay=tdelay+m;
                    size=size-1;
                    disp('someone from q3 left after 3min');
                    continue;
                end
            elseif(m>=120)
                if(randi([1 4])==2)
                    [q3,r3]=leaveQueue(q3,r3,i);
                    count=count+1;
                    tdelay=tdelay+m;
                    size=size-1;
                    disp('someone from q3 left after 2min');
                    continue;
                end
            end
        end
        i=i+1;
    end
    
    
    
    size=length(q4);
    i=1;
    while i<=size
        r=r4(i)*60;
        t=clock-q4(i);
        
        if(t>r)
            m=t-r;
            if(m>=240)
                [q4,r4]=leaveQueue(q4,r4,i);
                disp('someone from q4 left after 4min');
                count=count+1;
                tdelay=tdelay+m;
                size=size-1;
                continue;
            elseif(m>=180)
                if(randi([2 3])==3)
                    [q4,r4]=leaveQueue(q4,r4,i);
                    size=size-1;
                    count=count+1;
                    tdelay=tdelay+m;
                    disp('someone from q4 left after 3min');
                    continue;
                end
            elseif(m>=120)
                if(randi([1 4])==2)
                    [q4,r4]=leaveQueue(q4,r4,i);
                    count=count+1;
                    tdelay=tdelay+m;
                    size=size-1;
                    disp('someone from q4 left after 2min');
                    continue;
                end
            end
        end
        i=i+1;
    end
      
    
    
    
    size=length(q5);
    i=1;
    while i<=size
        r=r5(i)*60;
        t=clock-q5(i);
        
        if(t>r)
            m=t-r;
            if(m>=240)
                [q5,r5]=leaveQueue(q5,r5,i);
                disp('someone from q4 left after 4min');
                count=count+1;
                tdelay=tdelay+m;
                size=size-1;
                continue;
            elseif(m>=180)
                if(randi([2 3])==3)
                    [q5,r5]=leaveQueue(q5,r5,i);
                    size=size-1;
                    count=count+1;
                    tdelay=tdelay+m;
                    disp('someone from q4 left after 3min');
                    continue;
                end
            elseif(m>=120)
                if(randi([1 4])==2)
                    [q5,r5]=leaveQueue(q5,r5,i);
                    count=count+1;
                    tdelay=tdelay+m;
                    size=size-1;
                    disp('someone from q4 left after 2min');
                    continue;
                end
            end
        end
        i=i+1;
    end
    
end