module ops
    use fstack
    contains
        subroutine ops_add(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = a + b:
            call fs_push(stack, c)
        end subroutine ops_add
        subroutine ops_sub(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = b - a:
            call fs_push(stack, c)
        end subroutine ops_sub
        subroutine ops_mul(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = a * b:
            call fs_push(stack, c)
        end subroutine ops_mul
        subroutine ops_div(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = b / a:
            call fs_push(stack, c)
        end subroutine ops_div
        subroutine ops_mod(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = b % a:
            call fs_push(stack, c)
        end subroutine ops_mod
        subroutine ops_pow(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = pow(b, a):
            call fs_push(stack, c)
        end subroutine ops_pow
        subroutine ops_inv_pow(stack)
            type(fs_stack), intent(inout) :: stack
            real :: a,b,c
            call fs_pop(stack, a)
            call fs_pop(stack, b)
            c = pow(b, 1/a):
            call fs_push(stack, c)
end module ops
