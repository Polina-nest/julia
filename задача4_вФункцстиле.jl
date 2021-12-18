module MarkTrapz
    export mark_trapz!
    
    using HorizonSideRobots
    include("horizonside.jl")
    include("functional_robot.jl")
    

    function mark_trapz!(robot, num_steps::Integer)
  
        line = interface_line(robot.move!)
        trajectories = interface_trajectories(robot)

        putmarkers!(side, num_steps) = line.movements!(robot.putmarker!, side, num_steps)
        
        trajectories.snake!(Ost, Nord) do fold_direct
            (fold_direct==Ost) && robot.putmarker!()
            putmarkers!(fold_direct, num_steps)
            (fold_direct==West) && (num_steps -= 2)
            return true
        end
    end

    function mark_trapz!(robot)
       
        robot = interface_protected_robot(robot)
        line = interface_line(robot.move!)
      
        num_steps = line.get_num_movements!(Ost)
        line.movements!(West)
        mark_trapz!(robot, num_steps)
       
    end

end 
using HorizonSideRobots
using .MarkTrapz

robot = Robot(animate=true)
MarkTrapz.mark_trapz!(robot)
