program exercise1

  ! Compute an approximation to pi.

  ! An approximation using the Gauss-Legendre algorithm
  ! See, e.g., https://en.wikipedia.org/wiki/Gauss-Legendre_algorithm
  !
  ! Add an iteration which computes successive approximations
  ! to pi (say the first 5 or 6)
  !
  ! Try extended precision kind(1.d0)
  ! Can you add a condition that will exit the iteration when
  ! the approximation is close enough to the true value.
  ! Hint: you will need the intrinsic function abs() which returns
  ! the absolute value of the argument.

  implicit none

  ! integer, parameter :: kp = kind(1.e0)

  ! real (kp) :: a = 1.0_kp
  ! real (kp) :: b = 1.0/sqrt(2.0_kp)
  ! real (kp) :: t = 0.25_kp
  ! real (kp) :: p = 1.0_kp

  ! real (kp) :: an

  ! print *, "Approximation pi_0: ", (a + b)**2/(4.0*t)

  ! an = a

  ! a = (an + b)/2.0
  ! b = sqrt(an*b)
  ! t = t - p*(an - a)**2
  ! p = 2.0*p

  ! print *, "Approximation pi_1: ", (a + b)**2/(4.0*t)
  
    ! Define double precision kind (kind(1.d0))
    integer, parameter :: dp = kind(1.d0)
  
    ! Variables with double precision
    real(dp) :: a = 1.0_dp
    real(dp) :: b = 1.0_dp / sqrt(2.0_dp)
    real(dp) :: t = 0.25_dp
    real(dp) :: p = 1.0_dp
    real(dp) :: an, pi_approx, pi_true, tolerance
    integer :: i, max_iter
  
    ! Reference value for pi (double precision)
    pi_true = 3.14159265358979323846_dp
    tolerance = 1.0e-10_dp  ! Tolerance for convergence
    max_iter = 10           ! Maximum iterations to try
  
    ! Initial approximation (pi_0)
    pi_approx = (a + b)**2 / (4.0_dp * t)
    print *, "Iteration 0: ", pi_approx, " Difference: ", abs(pi_approx - pi_true)
  
    ! Iteration loop
    do i = 1, max_iter
      an = a
      a = (an + b) / 2.0_dp
      b = sqrt(an * b)
      t = t - p * (an - a)**2
      p = 2.0_dp * p
      pi_approx = (a + b)**2 / (4.0_dp * t)
  
      ! Print current approximation and difference from true pi
      print *, "Iteration ", i, ": ", pi_approx, " Difference: ", abs(pi_approx - pi_true)
  
      ! Check for convergence
      if (abs(pi_approx - pi_true) < tolerance) then
        print *, "Converged within tolerance ", tolerance, " after ", i, " iterations."
        exit
      end if
    end do
  
    ! If max iterations reached without convergence
    if (i > max_iter) then
      print *, "Maximum iterations (", max_iter, ") reached without convergence."
    end if
  
  

end program exercise1
