n=6;pa=0.2;ps=0.3;
customersServed=0;serverBusy=0;

Queue=int16.empty(60,0);index=1;

nextArrival=int16.empty(30,0);nextDeparture=int16.empty(30,0);clock=int16.empty(30,0);
qt=int16.empty(30,0);bt=int16.empty(30,0);delay=int16.empty(30,0);qt1=int16.empty(30,0);
total_delay=int16.empty(30,0);customers=int16.empty(30,0);status=int16.empty(30,0);
bt1=int16.empty(30,0);

nextArrival(1,1)=geometric(pa);nextDeparture(1,1)=1000;clock(1,1)=0;bt1(1,1)=0;
qt(1,1)=0;bt(1,1)=0;total_delay(1,1)=0;customers(1,1)=0;status(1,1)=0;qt1(1,1)=0;

i=2;
while customersServed<n
    %disp(clock(i-1,1));
    %disp(nextArrival(i-1,1));
    %disp(nextDeparture(i-1,1));
    if (nextArrival(i-1,1)<nextDeparture(i-1,1))
        clock(i,1) = nextArrival(i-1,1);
	else
		clock(i,1) = nextDeparture(i-1,1);
    end
    
    if(clock(i,1)==nextArrival(i-1,1))
        if(serverBusy==0)
            total_delay(i,1)=total_delay(i-1,1);
            nextDeparture(i,1)=clock(i,1)+geometric(ps);
            serverBusy=1;
            status(i,1)=1;
        else
            Queue(index,1)=nextArrival(i-1,1);
            index=index+1;
            total_delay(i,1)=total_delay(i-1,1);
            nextDeparture(i,1)=nextDeparture(i-1,1);
            status(i,1)=1;
        end
        nextArrival(i,1)=clock(i,1)+geometric(pa);
        customers(i,1)=index-1;
        bt(i,1)=bt(i-1,1)+(status(i-1,1)*(clock(i,1)-clock(i-1,1)));
        bt1(i,1)=(status(i-1,1)*(clock(i,1)-clock(i-1,1)));
        qt(i,1)=qt(i-1,1)+(customers(i-1,1)*(clock(i,1)-clock(i-1,1)));
        qt1(i,1)=(customers(i-1,1)*(clock(i,1)-clock(i-1,1)));
    else
        customersServed = customersServed + 1;
        serverBusy = 0;
        
        if(index>1)
            t=Queue(1,1);
            for j=2:index
                Queue(j,1)=Queue(j+1,1);
            end
            index=index-1;
            total_delay(i,1)=total_delay(i-1,1)+clock(i,1)-t;
            nextArrival(i,1)=nextArrival(i-1,1);
            nextDeparture(i,1)=clock(i,1)+geometric(ps);
            customers(i,1)=index-1;
            bt(i,1)=bt(i-1,1)+(status(i-1,1)*(clock(i,1)-clock(i-1,1)));
            bt1(i,1)=(status(i-1,1)*(clock(i,1)-clock(i-1,1)));
            qt(i,1)=qt(i-1,1)+(customers(i-1,1)*(clock(i,1)-clock(i-1,1)));
            qt1(i,1)=(customers(i-1,1)*(clock(i,1)-clock(i-1,1)));
            status(i,1)=1;
        else
            nextDeparture(i,1)=1000;
            nextArrival(i,1)=nextArrival(i-1,1);
            customers(i,1)=0;
            bt(i,1)=bt(i-1,1)+(status(i-1,1)*(clock(i,1)-clock(i-1,1)));
            bt1(i,1)=(status(i-1,1)*(clock(i,1)-clock(i-1,1)));
            qt(i,1)=qt(i-1,1)+(customers(i-1,1)*(clock(i,1)-clock(i-1,1)));
            qt1(i,1)=(customers(i-1,1)*(clock(i,1)-clock(i-1,1)));
            total_delay(i,1)=total_delay(i-1,1);
            status(i,1)=0;
        end
    end
    i=i+1;
    
end

ed=double(total_delay(i-1,1))/double(n);
eq=double(qt(i-1,1))/double(clock(i-1,1));
eu=double(bt(i-1,1))/double(clock(i-1,1));

disp(ed);
plot(clock(1:i-1),customers(1:i-1),'b');
hold on;
plot(clock(1:i-1),status(1:i-1),'-r');
%disp(eq);
%disp(eu);

%tab=table(clock,nextArrival,nextDeparture,status,customers,total_delay,qt,bt);
%disp(tab);


