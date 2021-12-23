function mark_cross!(r::Robot)
    for side in (Nord,Ost,Sud,West)
        putmarkers!(r,side)
        if isborder(r,side)==true && isborder(r,next(side))==false
            obhod(r,side)
            putmarker!(r)
            putmarkers!(r,side)
        end
        side_inv=inverse(side)
        move_by_marker!(r,side_inv)
    end
putmarker!(r)
end

function obhod(r::Robot,side::HorizonSide)
    k=0
    j=0
    
    while isborder(r,side)==true && isborder(r,next(side))==false
        move!(r,next(side)) 
        k+=1   
    end
    if isborder(r,side)==true && isborder(r,next(side))==true
        for _ in 1:k
            move!(r,inverse(next(side)))
        end
        k=0
    end
    while isborder(r,side)==true && isborder(r,inverse(next(side)))==false
        move!(r,inverse(next(side))) 
        j+=1   
    end
    if isborder(r,side)==true && isborder(r,inverse(next(side)))==true
        for _ in 1:j
            move!(r,next(side))
        end
    end
    if k==0
        k=j
        side1 = next(side)
    else
        side1 = inverse(next(side))
    end
    if isborder(r,side)==false
        print(side)
        move!(r,side)
        while (isborder(r,next(inverse(side)))==true &&(isborder(r,next(side))==false || isborder(r,inverse(next(side)))==false))
            move!(r,side)
        end
        for _ in 1:k
            move!(r,side1) 
        end
    end
end
function putmarkers!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end
function move_by_marker!(r::Robot,side::HorizonSide)
    while ismarker(r)==true
        if isborder(r,side)==false
            move!(r,side)
        elseif isborder(r,side)==true && isborder(r,next(side))==false
            obhod(r,side)
        end
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
next(side::HorizonSide)=HorizonSide(mod(Int(side)+3,4))
