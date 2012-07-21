module euclids_gcd
  implicit none

contains

  ! Algorithm: er_gcd(a, b) [euclid recursive greatest common divisor]
  !     Input: Non-negative integers a & b
  !     Output: gcd(a, b)
  !   if b = 0 then
  !     return a
  !   return er_gcd(b, a mod b)
  ! ------------------------------------------------------------------
  recursive function er_gcd(a, b) result(d)
    implicit none
    integer :: d
    integer, intent(in) :: a, b

    if (mod(a, b) /= 0) then
      d = er_gcd(b, mod(a, b))
    else
      d = b
    end if
  end function er_gcd

  recursive function erb_gcd(a, b) result(d)
    implicit none
    integer :: d
    integer, intent(in) :: a, b
    logical :: a_odd_flag, b_odd_flag, a_even_flag, b_even_flag

    a_even_flag = .true.
    b_even_flag = .true.
    if (mod(a, 2) /= 0) a_odd_flag = .true.
    if (mod(b, 2) /= 0) b_odd_flag = .true.
    if (a_odd_flag) a_even_flag = .false.
    if (b_odd_flag) b_even_flag = .false.

    if (a == b) then
      d = a
    else if ((a == 0) .and. (b == 0)) then
      d = 0
    else if (b == 0) then
      d = a
    else if (a == 0) then
      d = b
    else if ( a_even_flag .AND. b_even_flag) then
      d = 2 * erb_gcd(a/2, b/2)
    else if (a_even_flag .AND. b_odd_flag) then
      d = erb_gcd(a/2, b)
    else if ((a_odd_flag .AND. b_even_flag)) then
      d = erb_gcd(a, b/2)
    else if ((a_odd_flag) .AND.  (b_odd_flag)) then
      d = erb_gcd(abs(a-b)/2, b)
    end if


  end function erb_gcd

end module euclids_gcd