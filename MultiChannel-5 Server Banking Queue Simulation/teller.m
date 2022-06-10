function y=teller(q)
    y=-1;
    
    for i=1:length(q)
        if(q(i)==0)
            y=i;
            break;
        end
    end
    
end