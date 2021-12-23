function moveSideN!(r::Robot, side::HorizonSide, n)
    while n > 0
        if ismarker(r) == true
            break
        end
        move!(r, side)
        n -= 1
    end
end

function main9!(r::Robot)
    cnt = 0

    while true
        if ismarker(r) == true
            break
        end

        cnt += 1

        moveSideN!(r, Ost, cnt)
        if ismarker(r) == true
            break
        end

        moveSideN!(r, Sud, cnt)
        if ismarker(r) == true
            break
        end

        cnt += 1

        moveSideN!(r, West, cnt)
        if ismarker(r) == true
            break
        end

        moveSideN!(r, Nord, cnt)
        if ismarker(r) == true
            break
        end
    end         
end
