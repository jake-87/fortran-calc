program main
    use ops
    use fstack
    use strings
    type(fs_stack) :: mainstack
    character(len = 1000) :: input
    character(len = 100),  dimension(1000) :: args
    character :: delims
    real :: tempreal
    integer :: counter, nargs, var, var2, isstring, tempnum, sizecounter
    mainstack = fs_create_stack(2)
    do
        read(*,'(A)') input
        delims = ' '
        call parse(input, delims, args, nargs)
        sizecounter = 1
        do var = 1, nargs
            isstring = 0
            if ((args(var)(1:1)) > '9' .or. args(var)(1:1) < '0') then
                isstring = 1
            end if
            if (isstring == 0) then
                call fs_realloc_stack(mainstack, sizecounter + 1)
                sizecounter = sizecounter + 1
                read(args(var), *) tempnum
                call fs_push(mainstack, real(tempnum))
            else 
                select case (trim(args(var)))
                    case ("*")
                        call ops_mul(mainstack)
                    case ('+')
                        call ops_add(mainstack)
                    case ('-')
                        call ops_sub(mainstack)
                    case ('/')
                        call ops_div(mainstack)
                    case ('^')
                        call ops_pow(mainstack)
                    case ('%')
                        call ops_mod(mainstack)
                    case ('#')
                        call ops_inv_pow(mainstack)
                    case ('p')
                        call fs_peek(mainstack, tempreal)
                        print *, "PRINT : ",  tempreal
                    case default
                        print *, "String Not Reconsised : ", trim(args(var)) 
                end select
            end if
        end do
    end do
end program main
