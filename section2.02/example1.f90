program example1

  ! Array declarations/constructors ...
  ! ... and some intrinsic functions

  implicit none

  ! real, dimension(3)    :: a1
  ! real, dimension(-2:1) :: b1

  ! integer, dimension(2,3) :: m = reshape([ 1, 2, 3, 4, 5, 6], shape = [2,3])

  ! ! Fixed arrays with constructors
  ! integer, dimension(3), parameter :: s = (/ -1, 0, +1 /)  ! F2003 or
  ! integer, dimension(3), parameter :: t =  [ -1, 0, +1 ]   ! F2008

  ! integer :: i, j

  ! ! Check the lower and upper bounds of a1, b1
  ! ! via intrinsic functions lbound() and ubound()

  ! print *, "bounds of a1 are: ", lbound(a1), ubound(a1)
  ! print *, "bounds of b1 are: ", lbound(b1), ubound(b1)

  ! ! Check the size and shape of m with size() and shape()
  ! print *, "size(m) is:  ", size(m)
  ! print *, "shape(m) is: ", shape(m)

  ! ! Elements of s(3)  and t(3)
  ! do j = 1,3
  !    print *, "j s(j) t(j): ", j, s(j), t(j)
  ! end do

  ! ! Elements of m(2,3) in array element order
  ! do j = 1, 3
  !   do i = 1, 2
  !       print *, "i j m(i,j): ", i, j, m(i,j)
  !   end do
  ! end do


  ! Define double precision kind
  integer, parameter :: dp = kind(1.d0)

  ! Scalar variables
  real(dp) :: a, b, t, p, pi_approx, pi_true, tolerance
  integer :: i, conv_iter, max_iter

  ! Initialize
  pi_true = 3.14159265358979323846_dp
  tolerance = 1.0e-10_dp
  max_iter = 10
  a = 1.0_dp
  b = 1.0_dp / sqrt(2.0_dp)
  t = 0.25_dp
  p = 1.0_dp
  conv_iter = -1  ! -1 indicates no convergence yet

  ! Initial approximation
  pi_approx = (a + b)**2 / (4.0_dp * t)
  print *, "Iteration 0: ", pi_approx, " Difference: ", abs(pi_approx - pi_true)

  ! Loop until convergence or max iterations
  do i = 1, max_iter
    a = (a + b) / 2.0_dp
    b = sqrt(a * b)
    t = t - p * (a - (a + b) / 2.0_dp)**2
    p = 2.0_dp * p
    pi_approx = (a + b)**2 / (4.0_dp * t)

    print *, "Iteration ", i, ": ", pi_approx, " Difference: ", abs(pi_approx - pi_true)

    ! Check convergence
    if (abs(pi_approx - pi_true) < tolerance) then
      conv_iter = i
      exit
    end if
  end do

  ! Report convergence
  if (conv_iter /= -1) then
    print *, "Converged after ", conv_iter, " iterations within tolerance ", tolerance
  else
    print *, "Did not converge within ", max_iter, " iterations"
  end if
  
end program example1
