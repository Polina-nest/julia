
  
function mark_treugol!(r::Robot)
    num_vert = moves_end!(r, Sud)
    num_hor = moves_end!(r, West)
    h = 0
    i = (moves_end!(r,Nord))
    moves!(r,Sud)
    j = (moves_end!(r,Ost) - 1)
    moves!(r,West)
    for k in 0:i
        if k == 0
            putmarkers!(r,Ost)
            h+=1
        elseif k % 2 == 1
            putmarkers1!(r,West)
            h+=1
        elseif k % 2 == 0
            putmarkers!(r,Ost,(j-k))
            h+=1
        end
    end
    moves!(r, Sud)
    moves!(r, West)
    moves_end!(r, Nord, num_vert)
    moves_end!(r, Ost, num_hor)    
end
function moves_end!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
function moves!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
    end
end
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
function putmarkers!(r::Robot,side::HorizonSide,i::Int)
    for _ in 0:(i)
        putmarker!(r)
        move!(r,side)
    end
    putmarker!(r)
    move!(r,side)
    if (isborder(r,Nord)==false)
    move!(r,Nord)
    move!(r,West)
    end
end
function putmarkers!(r::Robot,side::HorizonSide)
    while isborder(r,side) == false
        putmarker!(r)
        move!(r,side)
    end
    putmarker!(r)
    if isborder(r,Nord)==false
        move!(r,Nord)
    end
end
function putmarkers1!(r::Robot,side::HorizonSide)
    if isborder(r,side)==false
        move!(r,side)
    end
    while isborder(r,side)==false
    putmarker!(r)
    move!(r,side)
    end
    putmarker!(r)
    if isborder(r,Nord)==false
        move!(r,Nord)
    end
end
function moves_end!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps 
        move!(r,side)
    end
end
