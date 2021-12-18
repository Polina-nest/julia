function mark_kross!(r::Robot)
    for side in (Nord,West,Sud,Ost) # - рассматриваем все направления которые возможны
        putmarkers!(r,side)
        move_by_markers(r,inverse(side))
    end
    putmarker!(r)
end

putmarkers!(r::Robot,side::HorizonSide) = 
    while isborder(r,side)==false 
        move!(r,side)
        putmarker!(r)
    end


move_by_markers(r::Robot,side::HorizonSide) = 
    while ismarker(r)==true 
        move!(r,side) 
    end # движение погка не попадет в клетку без маркера


inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 