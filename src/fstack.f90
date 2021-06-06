module fstack
    implicit none
    type fs_stack
        real, dimension(:), allocatable :: stack ! The stack itself, this is what stores the actual numbers.
        integer :: point = 1 ! Stores current position on stack
        integer :: stack_size ! Stores current stack size
    end type fs_stack
    contains
        subroutine fs_push(stack, x) ! Push element onto the stack
            type(fs_stack), intent(inout) :: stack
            real, intent(in) :: x
            if (stack%point < stack%stack_size) then
                stack%point = stack%point + 1
                stack%stack(stack%point) = x
            else ! Uh Oh, We have an overflow!
                write(0, *) "WARNING : Stack Overflow index (", stack%point + 1, ") is too large for size ", stack%stack_size
            end if
        end subroutine fs_push
        subroutine fs_pop(stack, x) ! Pop element from the stack
            type(fs_stack), intent(inout) :: stack
            real, intent(inout) :: x
            if ((stack%point /= 1)) then
                x = stack%stack(stack%point)
                stack%stack(stack%point) = 0
                stack%point = stack%point - 1
            else ! Uh Oh, Underflow!
                write(0, *) "WARNING : Stack Underflow"
                x = 0
            end if
        end subroutine fs_pop
        function fs_create_stack(x) result(stack) ! Create a new stack with size x
            type(fs_stack) :: stack
            integer, intent(in) :: x
            allocate(stack%stack(x))
            stack%stack_size = x
            stack%point = 1
        end function fs_create_stack
        subroutine fs_peek(stack, x) ! Just take a quick peek at the top element, which boils down to 1. Pop top, store top, re push top.
            type(fs_stack), intent(inout) :: stack
            real, intent(inout) :: x
            call fs_pop(stack, x)
            call fs_push(stack, x)
        end subroutine fs_peek
        subroutine fs_reset_stack(stack) ! Reset a stack back to all zeros.
            type(fs_stack), intent(inout) :: stack
            integer :: var
            call fs_cleanup_stack(stack)
            allocate(stack%stack(stack%stack_size))
            do var = 0, stack%stack_size
                stack%stack(var:var) = 0
                print *, stack%stack(var:var)
            end do
            stack%point = 1
        end subroutine fs_reset_stack
        subroutine fs_realloc_stack(stack, x) ! Reallocate a stack to size x, by making a copy, dealloc and reallocing the main stack, and copying the stuff we need and the pointer, while updaing the size.
            type(fs_stack), intent(inout) :: stack
            integer, intent(in) :: x
            type(fs_stack) :: tmpstack
            integer :: upper
            tmpstack = fs_create_stack(stack%stack_size)
            tmpstack%stack(1:stack%stack_size) = stack%stack(1:stack%stack_size)
            tmpstack%stack_size = stack%stack_size
            deallocate(stack%stack)
            allocate(stack%stack(x))
            upper = min(x, tmpstack%stack_size) ! allow for increase or decrease of stack_size
            stack%stack(1:upper) = tmpstack%stack(1:upper)
            stack%stack_size = x
            deallocate(tmpstack%stack)
        end subroutine fs_realloc_stack
        subroutine fs_cleanup_stack(stack) ! This just deallocs a stack. Easy enough.
            type(fs_stack) :: stack
            deallocate(stack%stack)
        end subroutine fs_cleanup_stack
end module fstack
