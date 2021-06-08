program main
    use ops
    use fstack
    use strings
    type(fs_stack) :: mainstack
    character(len = 1000) :: input
    character(len=15) :: numbers = "1234567890."
    character(len = 5) :: prompt = ">>>"
    character(len = 30),  dimension(1000) :: args
    character :: delims
    real :: tempreal, tempnum
    integer :: nargs, var, sizecounter, i = 0
    mainstack = fs_create_stack(5)
    sizecounter = 5
    call fs_push(mainstack, 0.0)
    call fs_push(mainstack, 0.0)
    do ! repeat the calculator until the user exits
        write(* ,'(A)', advance="no") prompt
        read(*,'(A)') input ! Read user input
        delims = ' '
        call parse(input, delims, args, nargs) ! Split user imput into an array
        do var = 1, nargs
            i = 1
            if (((verify(trim(args(var)), numbers)) == 0)) then ! Check if array(var) contains only numbers
                call fs_realloc_stack(mainstack, sizecounter + 1) ! If yes, push that number onto the stack
                sizecounter = sizecounter + 1
                read(args(var), *) tempnum
                call fs_push(mainstack, real(tempnum))
                i = 0
            else if (mainstack%point > 1) then ! If no, and we have the opertunity
                select case (trim(args(var))) ! Check what operator the user may have entered
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
                    case ('.atan')
                        call ops_atan(mainstack)
                        i = 0
                    case ('.asin')
                        call ops_asin(mainstack)
                        i = 0
                    case ('.acos')
                        call ops_acos(mainstack)
                        i = 0
                    case ('.ratan')
                        call ops_atanr(mainstack)
                        i = 0
                    case ('.rasin')
                        call ops_asinr(mainstack)
                        i = 0
                    case ('.racos')
                        call ops_acosr(mainstack)
                        i = 0
                    case ('.loge')
                        call ops_loge(mainstack)
                        i = 0
                    case ('.log10')
                        call ops_log10(mainstack)
                        i = 0
                    case ('.log')
                        call ops_log(mainstack)
                        i = 0
                    case default ! If no operator was entered, set i to something other than 0
                        i = 100
                end select
            end if
            if (i /= 0) then ! If i is not zero, check if the user imputted a command
                select case(trim(args(var)))
                    case ('pp')
                        print *, "PRINT : ", mainstack%point
                    case ('p')
                        call fs_peek(mainstack, tempreal)
                        print *, "PRINT : ",  tempreal
                    case ('r')
                        call fs_reset_stack(mainstack)
                        call fs_realloc_stack(mainstack, 5)
                        sizecounter = 2
                    case ('q')
                        stop
                    case ('help')
                        print *, "PRINT : Reverse Poland notation calculator."
                        print *, "PRINT : Avalible ops: ", " + - * / ^ # .sin .cos .tan .rsin .rcos .rtan .asin .acos .atan"
                        print *, "PRINT : .rasin .racos .ratan .loge .log10 .log"
                        print *, "PRINT : Avalible commands:", " p (print top of stack) r (reset stack) q (quit) pp (print pointer)"
                    case ('pop')
                        call fs_pop(mainstack, tempreal)
                    case default ! If no, we do not know what they inputted, so we tell them that.
                        print *, "? (", args(var), ") unknown" 
                end select
            end if
        end do
    end do
end program main
