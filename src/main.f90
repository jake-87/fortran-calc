program main
    use ops
    use fstack
    use strings
    type(fs_stack) :: mainstack
    character(len = 1000) :: input
    character(len = 30) :: prompt = ">>>"
    character(len = 30),  dimension(1000) :: args
    character :: delims
    real :: tempreal, tempnum
    integer :: nargs, var, isstring, sizecounter, i
    mainstack = fs_create_stack(2)
    sizecounter = 2
    do
        write(* ,'(A)', advance="no") prompt
        read(*,'(A)') input
        delims = ' '
        call parse(input, delims, args, nargs)
        do var = 1, nargs
            i = 199
            isstring = 0
            if ((args(var)(1:1)) > '9' .or. args(var)(1:1) < '0') then
                isstring = 1
            end if
            if (isstring == 0) then
                call fs_realloc_stack(mainstack, sizecounter + 1)
                sizecounter = sizecounter + 1
                read(args(var), *) tempnum
                call fs_push(mainstack, real(tempnum))
                i = 0
            else if (mainstack%point > 2) then
                select case (trim(args(var)))
                    case ("*")
                        call ops_mul(mainstack)
                        i = 0
                    case ('+')
                        call ops_add(mainstack)
                        i = 0
                    case ('-')
                        call ops_sub(mainstack)
                        i = 0
                    case ('/')
                        call ops_div(mainstack)
                        i = 0
                    case ('^')
                        call ops_pow(mainstack)
                        i = 0
                    case ('%')
                        call ops_mod(mainstack)
                        i = 0
                    case ('#')
                        call ops_inv_pow(mainstack)
                        i = 0
                    case('.sin')
                        call ops_sin(mainstack)
                        i = 0
                    case('.cos')
                        call ops_cos(mainstack)
                        i = 0
                    case ('.tan')
                        call ops_tan(mainstack)
                        i = 0
                    case ('.rtan')
                        call ops_rtan(mainstack)
                        i = 0
                    case ('.rsin')
                        call ops_rsin(mainstack)
                        i = 0
                    case ('.rcos')
                        call ops_rcos(mainstack)
                        i = 0
                    case default
                        i = 100
                end select
            end if
            if (i /= 0) then
                select case(trim(args(var)))
                    case ('p')
                        call fs_peek(mainstack, tempreal)
                        print *, "PRINT : ",  tempreal
                    case ('r')
                        call fs_reset_stack(mainstack)
                        call fs_realloc_stack(mainstack, 2)
                        sizecounter = 2
                    case('ps')
                        do i = 1, mainstack%stack_size
                            if (i == mainstack%point) then
                                print *, mainstack%stack(i), "<--- pointer"
                            else
                                print *, mainstack%stack(i)
                            end if
                        end do
                    case ('q')
                        stop
                    case ('help')
                        print *, "Reverse Poland notation calculator."
                        print *, "Avalible ops: ", " + - * / ^ # .sin .cos .tan .rsin .rcos .rtan"
                        print *, "Avalible commands:", " p (print top of stack) r (reset stack) q (quit) ps (print stack)"
                    case default
                        print *, "?" 
                end select
            end if
        end do
    end do
end program main
