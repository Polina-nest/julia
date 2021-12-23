function main13!(r::Robot)
      putmarker!(r)
      upleft!(r)
      upright!(r)
      downleft!(r)
      downright!(r)
end

function upleft!(r::Robot)
      x, y = 0, 0
      while isborder(r, West) == false && isborder(r, Nord) == false
            move!(r, West)
            x += 1

            move!(r, Nord)
            y += 1

            putmarker!(r)
      end

      while x > 0 && y > 0
            move!(r, Ost)
            x -= 1

            move!(r, Sud)
            y -= 1
      end
end

function upright!(r::Robot)
      x, y = 0, 0
      while isborder(r, Ost) == false && isborder(r, Nord) == false
            move!(r, Ost)
            x += 1

            move!(r, Nord)
            y += 1

            putmarker!(r)
      end

      while x > 0 && y > 0
            move!(r, West)
            x -= 1

            move!(r, Sud)
            y -= 1
      end
end

function downleft!(r::Robot)
      x, y = 0, 0
      while isborder(r, West) == false && isborder(r, Sud) == false
            move!(r, West)
            x += 1

            move!(r, Sud)
            y += 1

            putmarker!(r)
      end

      while x > 0 && y > 0
            move!(r, Ost)
            x -= 1

            move!(r, Nord)
            y -= 1
      end
end

function downright!(r::Robot)
      x, y = 0, 0
      while isborder(r, Ost) == false && isborder(r, Sud) == false
            move!(r, Ost)
            x += 1

            move!(r, Sud)
            y += 1

            putmarker!(r)
      end

      while x > 0 && y > 0
            move!(r, West)
            x -= 1

            move!(r, Nord)
            y -= 1
      end
end
