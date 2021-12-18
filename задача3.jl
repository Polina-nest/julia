function mark_all(r::Robot)
    nun_vert = get_num_steps_movements!(r,Sud)
    nun_hor = get_num_steps_movements!(r,West)
    #УТВ: Робот - в юго-западном углу

    side = Ost
    mark_row!(r,side)
    while isborder!(r,Nord)==false
        side=inverse(side)
        mark_row!(r,side)
    end
    #УТВ: Робот - у северной границы, в одном из углов

    movements!(r,Sud)
    movements!(r,West)
    #УТВ: Робот - в юго-западном углу

    movemens!(r,Ost,num_hor)
    movemens!(r,Nord,num_vert)
end