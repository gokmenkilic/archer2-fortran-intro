program sqrt_exercise
  implicit none

  ! Part 1: Complex variable
  complex :: z = (-1.0, 0.0)  ! -1 + 0i
  complex :: sqrt_z

  ! Part 2: Real variable
  real :: x = -1.0
  real :: sqrt_x

  ! Compute square root of complex -1
  sqrt_z = sqrt(z)
  print *, "Square root of -1 (complex): ", sqrt_z

  ! Attempt square root of real -1
  sqrt_x = sqrt(x)
  print *, "Square root of -1 (real): ", sqrt_x

end program sqrt_exercise
