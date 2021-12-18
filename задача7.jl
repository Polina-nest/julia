# task7.jl
include("roblib.jl")
#=
    файл roblib.jl содержит определения функций:
    move!(::Robot,::HorizonSide,::Int) или обобщенный вариант move!(::Any,::Any,::Any) - тут важно, что аргумента 3, а не 2
    movements!(::Robot,::HorizonSide) или обобщенный вариант movements!(::Any,::Any)
=#

module ShessMark
    import Main.inverse, Main.movements!
    #=
        Предполагается, что функции inverse, movements! определены в пространстве имен Main
        (например, в результате выполнения include("roblib.jl"))
    =#
    import ..StartBack.move_to_start!, ..StartBack.move_to_back!
    #=
        Предполагается, что модуль StartBack был определен в том же пространстве имен, что и данный модуль ShessMark
        (поэтому и ..StartBack. - эти две точки в начале означают, что модуль StartBack надо искать в пространстве имен на 1 иерархичекий
        уровень выше данного)
    =#

    using HorizonSideRobots

    export mark_chess

    FLAG_MARK = false # здесь безразлично, какое именно значение присвоено, т.к. оно потом переопределяется

    function mark_chess(robot)
        global FLAG_MARK
        #=
            Глобальные переменные, ввиду их особой важности, следует именовать заглаными буквами.
            Объявление переменной как global требуется, только если ее значение ИЗМЕНЯЕТСЯ в теле функции,
            использоваться же она может и без такого объявления
        =#
        num_steps = move_to_start!(robot, (Sud,West))
        #УТВ: Робот - в юго-западном углу

        FLAG_MARK = odd(sum(num_steps)) ? true : false
        # значение FLAG_MARK определяет, нужно ли в юго-западном углу ставить маркер

        #=
            Можно было бы и не вводить локалную переменную num_steps, написав так:

        FLAG_MARK = odd(sum(move_to_start!(robot, (Sud,West)))) ? true : false

            или так:

        FLAG_MARK = (move_to_start!(robot, (Sud,West)) |> sum |> odd) ? true : false

        где |> - оператор, направляющий поток данных
        =#

        side = Ost
        mark_chess(robot,side)
        while isborder(Nord)==false
            move!(robot,Nord)
            side = inverse(side)
            mark_chess(robot,side)
        end
        #УТВ: Робот - у северной границы поля И маркеры расставлены в шахматном порядке

        for side in (West,Sud) movements!(robot,side) end
        #УТВ: Робот - в юго-западном углу

        move_to_back!(robot)
        #УТВ: Робот - в исходном положении
    end

    function mark_chess(r,side)
        putmarker!(r)
        while isborder(r,side)==false
            move!(r,side)
            putmarker!(r)
        end
    end

    function putmarker!(r)
        global FLAG_MARK
        if FLAG_MARK == true
            HjrizonSideRobots.putmarker(r)
        end
        FLAG_MARK = !FLAG_MARK
    end

end