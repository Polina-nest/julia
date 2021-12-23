function moveFull!(r::Robot, side::HorizonSide, n)
    while n > 0
        move!(r, side)
        n -= 1
    end
end

function main8!(r::Robot)
    cnt = 0

    while true
        if isborder(r, Nord) == false
            break
        end

        cnt += 1

        if cnt % 2 == 1
            moveFull!(r, West, cnt)
        else
            moveFull!(r, Ost, cnt)
        end
    end         
end
