function main6!(r::Robot)
      x, y1, y2 = getStartPos!(r)
      height = getHeight(r)
      up = moveToBorder!(r, x, height)
      mark_border!(r, up)
      setLeftDown!(r)
      while y2 > 0
            y2 -= 1
            move!(r, Nord)
      end
      while x > 0
            x -= 1
            move!(r, Ost)
      end
      while y1 > 0
            y1 -= 1
            move!(r, Nord)
      end
end

function getStartPos!(r::Robot)
      x, y1, y2 = 0, 0, 0
      while isborder(r, Sud) == false
            y1 += 1
            move!(r, Sud)
      end
      while isborder(r, West) == false
            x += 1
            move!(r, West)
      end
      while isborder(r, Sud) == false
            y2 += 1
            move!(r, Sud)
      end
      return x, y1, y2
end

function moveToBorder!(r::Robot, X, Y)
      x = 0
      while true
            y = 0
            if x % 2 == 0
                  while isborder(r, Nord) == false
                        move!(r, Nord)
                        y += 1
                  end
            else
                  while isborder(r, Sud) == false
                        move!(r, Sud)
                        y += 1
                  end
            end
            if y != Y || isborder(r, Ost) == true
                  if x % 2 == 0
                        return true
                  else
                        return false
                  end
                  break
            end
            move!(r, Ost)
            x += 1
      end
end

function getHeight(r::Robot)
      height = 0
      while isborder(r, Nord) == false
            height += 1
            move!(r, Nord)
      end
      while isborder(r, Sud) == false
            move!(r, Sud)
      end
      return height
end

function mark_border!(r, up)
      if up
            while isborder(r, Nord) == true
                  putmarker!(r)
                  move!(r, Ost)
            end
            move!(r, Nord)

            while isborder(r, West) == true
                  putmarker!(r)
                  move!(r, Nord)
            end
            move!(r, West)

            while isborder(r, Sud) == true
                  putmarker!(r)
                  move!(r, West)
            end
            move!(r, Sud)

            while isborder(r, Ost) == true
                  putmarker!(r)
                  move!(r, Sud)
            end
      else
            while isborder(r, Sud) == true
                  putmarker!(r)
                  move!(r, Ost)
            end
            move!(r, Sud)
            
            while isborder(r, West) == true
                  putmarker!(r)
                  move!(r, Sud)
            end
            move!(r, West)

            while isborder(r, Nord) == true
                  putmarker!(r)
                  move!(r, West)
            end
            move!(r, Nord)

            while isborder(r, Ost) == true
                  putmarker!(r)
                  move!(r, Nord)
            end
      end
end

function setLeftDown!(r::Robot)
      while isborder(r, Sud) == false
          move!(r, Sud)
      end
      while isborder(r, West) == false
          move!(r, West)
      end
  end
