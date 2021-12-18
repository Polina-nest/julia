
function mark_zebra!(robot, line_side, ortogonal_line_side, num_passes, num_start_passes=0)
    start_side = get_start_side(line_side,ortogonal_line_side)
    
    nun_steps = [get_num_movements!(robot,start_side[i]) for i in 1:2]


    movements_if_posible!(robot, ortogonal_line_side, num_start_passes) || return
    line_mark!(robot,line_side)
    while movements_if_posible!(robot,ortogonal_line_side, num_passes) == true
        line_side = inverse(line_side)
        line_mark!(robot,line_side)
    end
    

    for s in start_side
        movements!(r,s)
    end

    back_side=inverse(start_side)
    for (i,num) in arange(num_steps)
        movements!(robot,back_side[i], num)
    end
    
end

function movements_if_posible!(robot, side, max_num_steps)
    for _ in 1:max_num_steps
        isborder(robot,side) && (return false)
        move!(robot,side)
    end
    return true
end

function line_mark!(robot,side)
    putmarker!(robot)
    putmarkers!(robot,side)
end

get_start_side(line_side::NTuple{2,HorizonSide}, ortogonal_line_side::NTuple{2,HorizonSide}) = ortogonal_line_side

isborder(r::Robot,side::NTuple{2,HorizonSide}) = isborder(r,side[1]) || isborder(r,side[2])

move!(r::Robot,side::NTuple{2,HorizonSide}) = for s in side move!(r,s) end

putmarkers!(r::Robot,side::NTuple{2,HorizonSide}) =
    while isborder(r,side)==false
        move!(r,side)
        putmatker!(r)
    end