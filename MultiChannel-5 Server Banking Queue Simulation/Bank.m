Queue1=[];Queue2=[];Queue3=[];Queue4=[];Queue5=[]; %declare all the queues for 5 teller
regen1=[];regen2=[];regen3=[];regen4=[];regen5=[];
Teller=[0,0,0,0,0]; %declare all the server status and make it idle //idle=0,busy=1;

clock=0;timeRemaining=12*60*60;
arrival=nextArrival();departure=[realmax,realmax,realmax,realmax,realmax];
regenCount=0;
regenDelay=0;
delay=0;
customerCount=0;

while clock<timeRemaining
    [early,Nq]=earlyDeparture(departure);
    
    if arrival<early
        clock=arrival;
    else
        clock=early;
    end
    
    [Queue1,Queue2,Queue3,Queue4,Queue5,regen1,regen2,regen3,regen4,regen5,rco,rdel]=renege(clock,Queue1,Queue2,Queue3,Queue4,Queue5,regen1,regen2,regen3,regen4,regen5);
    regenCount=regenCount+rco;
    regenDelay=regenDelay+rdel;
    
    
    if(clock==arrival)
        disp("arrival");
        idle=teller(Teller); %get the index of idle teller, if all busy returns -1
        
        if(idle~=-1)
            Teller(idle)=1; %make the teller busy
            departure(idle)=clock+nextDeparture();
        else
            [Queue1,Queue2,Queue3,Queue4,Queue5,regen1,regen2,regen3,regen4,regen5]=shortestQueue(Queue1,Queue2,Queue3,Queue4,Queue5,arrival,regen1,regen2,regen3,regen4,regen5);
        end
        arrival=clock+nextArrival();
    else
        disp("departure");
        customerCount=customerCount+1;
        Teller(Nq)=0;
        disp(["Someone departed from queue",Nq])
        if(Nq==1)
            if(~isempty(Queue1))
                Teller(Nq)=1;
                departure(Nq)=clock+nextDeparture();
                [Queue1,regen1,del]=leaveQueue(Queue1,regen1,1);
                delay=delay+clock-del;
            else
                departure(Nq)=realmax;
            end
        elseif(Nq==2)
            if(~isempty(Queue2))
                Teller(Nq)=1;
                departure(Nq)=clock+nextDeparture();
                [Queue2,regen2,del]=leaveQueue(Queue2,regen2,1);
                delay=delay+clock-del;
            else
                departure(Nq)=realmax;
            end
        elseif(Nq==3)
            if(~isempty(Queue3))
                Teller(Nq)=1;
                departure(Nq)=clock+nextDeparture();
                [Queue3,regen3,del]=leaveQueue(Queue3,regen3,1);
                delay=delay+clock-del;
            else
                departure(Nq)=realmax;
            end
        elseif(Nq==4)
            if(~isempty(Queue4))
                Teller(Nq)=1;
                departure(Nq)=clock+nextDeparture();
                [Queue4,regen4,del]=leaveQueue(Queue4,regen4,1);
                delay=delay+clock-del;
            else
                departure(Nq)=realmax;
            end
        elseif(Nq==5)
            if(~isempty(Queue5))
                Teller(Nq)=1;
                departure(Nq)=clock+nextDeparture();
                [Queue5,regen5,del]=leaveQueue(Queue5,regen5,1);
                delay=delay+clock-del;
            else
                departure(Nq)=realmax;
            end
        end
    
    end
    
    disp([clock,Teller]);
    %disp(departure(1));
    disp([length(Queue1),length(Queue2),length(Queue3),length(Queue4),length(Queue5)]);
    
end

%disp(delay);
disp(["Total customer server: ",customerCount]);
disp(["Expected delay",double(delay)/customerCount,"seconds"]);
%disp(["Number of customer reneged: ",regenCount]);
disp(["Proportion of customer regened: ",double(regenCount)/customerCount*100,"%"]);
disp(["Expected avg delay of regening customer: ",double(regenDelay)/regenCount,"seconds"]);