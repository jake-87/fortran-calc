module ops
    use fstack
    contains
        subroutine ops_add(stack) ! Add 2 numbers from the stack
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = a + b
            call fs_push(stack, c)
        end subroutine ops_add
        subroutine ops_sub(stack) ! See add
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = b - a
            call fs_push(stack, c)
        end subroutine ops_sub
        subroutine ops_mul(stack) ! See add
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = a * b
            call fs_push(stack, c)
        end subroutine ops_mul
        subroutine ops_div(stack) ! See add
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = b / a
            call fs_push(stack, c)
        end subroutine ops_div
        subroutine ops_mod(stack) ! Modulo
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = modulo(b,a)
            call fs_push(stack, c)
        end subroutine ops_mod
        subroutine ops_pow(stack) ! Powers
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = b ** a
            call fs_push(stack, c)
        end subroutine ops_pow
        subroutine ops_inv_pow(stack) ! Roots, via inverse powers
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = b ** (1/a)
            call fs_push(stack, c)
        end subroutine ops_inv_pow
        subroutine ops_sin(stack) ! Trig functions
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = sind(a)
            call fs_push(stack, c)
        end subroutine ops_sin
        subroutine ops_cos(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = cosd(a)
            call fs_push(stack, c)
        end subroutine ops_cos
        subroutine ops_tan(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = tand(a)
            call fs_push(stack, c)
        end subroutine ops_tan
        subroutine ops_rtan(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = tan(a)
            call fs_push(stack, c)
        end subroutine ops_rtan
        subroutine ops_rsin(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = sin(a)
            call fs_push(stack, c)
        end subroutine ops_rsin
        subroutine ops_rcos(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = cos(a)
            call fs_push(stack, c)
        end subroutine ops_rcos
        subroutine ops_acos(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = acosd(a)
            call fs_push(stack, c)
        end subroutine ops_acos
        subroutine ops_asin(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = asind(a)
            call fs_push(stack, c)
        end subroutine ops_asin
        subroutine ops_atan(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = atand(a)
            call fs_push(stack, c)
        end subroutine ops_atan
        subroutine ops_acosr(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = acos(a)
            call fs_push(stack, c)
        end subroutine ops_acosr
        subroutine ops_asinr(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = asin(a)
            call fs_push(stack, c)
        end subroutine ops_asinr
        subroutine ops_atanr(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = atan(a)
            call fs_push(stack, c)
        end subroutine ops_atanr
        subroutine ops_loge(stack) ! Natural Log
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = log(a)
            call fs_push(stack, c)
        end subroutine ops_loge
        subroutine ops_log10(stack) ! Log 10
            type(fs_stack), intent(inout) :: stack
            real :: a,c
            call fs_pop(stack, a)
            c = log10(a)
            call fs_push(stack, c)
        end subroutine ops_log10
        subroutine ops_log(stack) ! Log with base of number off stack, via natural log division.
            type(fs_stack), intent(inout) :: stack
            real :: a,c,b
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = log (a) / log (b)
            call fs_push(stack, c)
        end subroutine ops_log
end module ops
