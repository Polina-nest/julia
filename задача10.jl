function sum_temp(r::Robot)
    sum = 0 
    count = 0
    side = Ost
    while isborder(r,Nord) == false
        s, c=moves!(r,side)
        sum+=s
        count+=c
        side = inverse(side)
    end
    s, c=moves!(r,side)
    sum+=s
    count+=c
    return (sum/count)
end
function moves!(r::Robot,side::HorizonSide)
    sum = 0 
    count = 0
    while isborder(r,side) == false
        if ismarker(r) == true
            count+=1
            sum+= temperature(r)
        end
        move!(r,side)
    end
    if isborder(r,Nord) == false
        move!(r,Nord)
    end
    return sum, count
end
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
