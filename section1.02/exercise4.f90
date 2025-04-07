program exercise4

  ! Compute an approximation to the conductance of a narrow channel.

  ! The steady volume flux (volume flow rate) Q in a rectangular
  ! capillary of cross section width x height 2b x 2c (with 2b > 2c)
  ! we can write:
  !
  !    Q = -C (dp/dx) / eta
  !
  ! with dp/dx the pressure gradient and eta the dynamic viscosity.
  ! One can define a viscosity-independent conductance C
  !
  !    C = (4/3) b c^3 [ 1 - 6(c/b) \sum_k tanh (a_k b/c)/a_k^5 ]
  !
  ! where a_k = (2k - 1) pi/2 and the sum is k = 1, ..., \inf.
  !
  ! E.g. T. Papanastasiou, G. Georiou, and A. Alexandrou,
  ! "Viscous Fluid Flow" CRC Press, Boca Raton, Florida (2000).

  !  Exercise
  !  Compute the first term in the series (i.e., k = 1):
  !
  !  C_1 = (4/3) b c^3 [ 1 - 6(c/b) tanh(a_k b/c) / a_k^5 ]
  !
  !  We will use the sample values w = 62, h = 30.
  !
  !  You will need the intrinsic function tanh() for hyperbolic tangent.
  !
  !  Your result should be in the region of 97277.88 ( the exact figure
  !  depending on precision).

  !  Try for both real32 and real64.
  !  Does your compiler support kind real128?


  ! Some appropriate output might be ...
  ! print *, "Value of w:       ", w
  ! print *, "Value of h:       ", h
  ! print *, "Value of pi:      ", pi
  ! print *, "Approximation is: ", conductance

integer, parameter :: sp = selected_real_kind (6,37)
integer, parameter :: dp = selected_real_kind (15,307)
integer, parameter :: qp = selected_real_kind (33,4931)

real(sp) :: w32, h32, b32, c32, pi32, a1_32, conductance32
real(dp) :: w64, h64, b64, c64, pi64, a1_64, conductance64
real(qp) :: w128, h128, b128, c128, pi128, a1_128, conductance128

! Define pi with sufficient precision for each kind
  pi_sp = 3.14159265359_sp
  pi_dp = 3.14159265359_dp
  pi_qp = 3.14159265359_qp

 ! Set sample values
  w_sp = 62.0_sp;  h_sp = 30.0_sp
  w_dp = 62.0_dp;  h_dp = 30.0_dp
  w_qp = 62.0_qp;  h_qp = 30.0_qp

  ! Compute b and c (half of width and height)
  b_sp = w_sp / 2.0_sp;  c_sp = h_sp / 2.0_sp
  b_dp = w_dp / 2.0_dp;  c_dp = h_dp / 2.0_dp
  b_qp = w_qp / 2.0_qp;  c_qp = h_qp / 2.0_qp

  ! Compute a_1 = (2k - 1) * pi / 2 for k = 1
  a1_sp = pi_sp / 2.0_sp
  a1_dp = pi_dp / 2.0_dp
  a1_qp = pi_qp / 2.0_qp

  ! Compute conductance C_1 for each precision
  conductance_sp = (4.0_sp / 3.0_sp) * b_sp * c_sp**3 * &
                   (1.0_sp - 6.0_sp * (c_sp / b_sp) * &
                   tanh(a1_sp * b_sp / c_sp) / a1_sp**5)
  conductance_dp = (4.0_dp / 3.0_dp) * b_dp * c_dp**3 * &
                   (1.0_dp - 6.0_dp * (c_dp / b_dp) * &
                   tanh(a1_dp * b_dp / c_dp) / a1_dp**5)
  conductance_qp = (4.0_qp / 3.0_qp) * b_qp * c_qp**3 * &
                   (1.0_qp - 6.0_qp * (c_qp / b_qp) * &
                   tanh(a1_qp * b_qp / c_qp) / a1_qp**5)

  ! Output results
  print *, "Single precision (real32):"
  print *, "Value of w:       ", w_sp
  print *, "Value of h:       ", h_sp
  print *, "Value of pi:      ", pi_sp
  print *, "Approximation is: ", conductance_sp

  print *, "Double precision (real64):"
  print *, "Value of w:       ", w_dp
  print *, "Value of h:       ", h_dp
  print *, "Value of pi:      ", pi_dp
  print *, "Approximation is: ", conductance_dp

  ! Check if quad precision is supported
  if (qp /= -1) then
    print *, "Quad precision (real128):"
    print *, "Value of w:       ", w_qp
    print *, "Value of h:       ", h_qp
    print *, "Value of pi:      ", pi_qp
    print *, "Approximation is: ", conductance_qp
  else
    print *, "Quad precision (real128) is not supported by this compiler."
  end if

end program exercise4
