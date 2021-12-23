function mark_treugol!(r::Robot)
    num_vert = moves_end!(r, Sud)
    num_hor = moves_end!(r, West)
    h = 0
    i = (moves_end!(r,Nord))
    moves!(r,Sud)
    j = (moves_end!(r,Ost))
    moves!(r,West)
    for k in 0:i
        if (k == 0) || (k % 2 == 0)
            putmarkers2!(r,Ost,j)
            h+=1
            j-=1
        elseif k % 2 == 1
            putmarkers1!(r,West,j)
            h+=1
            j-=1
        end
    end
    moves!(r, West)
    moves!(r, Sud)
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
function putmarkers!(r::Robot,side::HorizonSide,num_steps::Int)
    go_and_obhod(r,side,num_steps)
    putmarker!(r)
    if isborder(r,Nord)==false
        move!(r,Nord)
    end
end
function putmarkers2!(r::Robot,side::HorizonSide,num_steps::Int) #work
    go_and_obhod(r,side,num_steps)
    putmarker!(r)
    if isborder(r,Nord)==false
        move!(r,Nord)
    end
end
function putmarkers1!(r::Robot,side::HorizonSide,num_steps::Int)
    if isborder(r,side)==false
        move!(r,side)
    elseif isborder(r,side)==true
        k=0
        while isborder(r,side)==true
            move!(r,Nord)
            k+=1
        end
        move!(r,side)
        if isborder(r,Sud)==true
            move!(r,side)
        end
        for _ in 1:k
            move!(r,Sud)
        end            
    end
    go_and_obhod(r,side,num_steps)
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
function go_and_obhod(r::Robot,side::HorizonSide,num_steps::Int)
    q=0
    k=0
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
end
