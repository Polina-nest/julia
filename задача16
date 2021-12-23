function mark_all!(r::Robot)
    num_vert,num_hor = ugol(r)
    side = Ost
    num_steps = moves!(r,Ost)
    for _ in 1:num_steps
        move!(r,West)
    end
    putmarkers!(r,side,num_steps)
    while isborder(r,Nord)==false    
        if isborder(r,side)==true
            side = inverse(side)
            putmarkers!(r,side,num_steps)
        end
    end  
    putmarkers_last!(r,Ost)
    moves!(r, West)
    moves!(r, Sud)
    moves!(r, Ost, num_hor)
    moves1!(r, Nord, num_vert)
end
function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
function moves1!(r::Robot,side::HorizonSide,num_steps::Int)
    q=0
    while q<num_steps 
        if isborder(r,Nord)==true
            while isborder(r,side)==true
                move!(r,Ost)
            end
            move!(r,Nord)
            q+=1
            if isborder(r,West)==true
                while isborder(r,West)==true
                    move!(r,Nord)
                    q+=1
                end
            end
            move!(r,West)
        end
        if q<num_steps
        move!(r,side)
        q+=1
        end
    end
end
function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps # символ "_" заменяет фактически не используемую переменную
        move!(r,side)
    end
end
function putmarkers!(r::Robot,side::HorizonSide,num_steps::Int)
    q=0
    while q<num_steps
        k=0
       putmarker!(r)
       if isborder(r,side)==false
            move!(r,side)
            q+=1
       else isborder(r,side)==true
            while isborder(r,side)==true
                move!(r,Nord)
                k+=1
            end
            move!(r,side)
            q+=1
            if isborder(r,Sud)==true
                move!(r,side)
                q+=1
            end
            for _ in 1:k
                move!(r,Sud)
            end            
       end
    end
    putmarker!(r)
    move!(r,Nord)
end
function putmarkers_last!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        putmarker!(r) 
        move!(r,side)
    end
    putmarker!(r)
end
function ugol(r::Robot)
    num_vert=0
    num_hor=0
    while (isborder(r,Sud)==false || isborder(r,West)==false)
        num_vert+= moves!(r, Sud)
        num_hor+= moves!(r, West)
        repeat
    end
    return num_vert,num_hor
end
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
