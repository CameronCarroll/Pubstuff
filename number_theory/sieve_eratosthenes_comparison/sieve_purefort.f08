program testsieve
  implicit none
  integer, parameter :: iterations = 10000
  integer, dimension(iterations) :: result
  call sieve_of_eratosthenes(iterations, result)
  !call print_primes(iterations, result)

contains

  subroutine sieve_of_eratosthenes(max_value, number_list)
    implicit none

    integer, intent(in) :: max_value
    integer, dimension(max_value), intent(out) :: number_list(max_value)
    integer :: outer_high_bound, inner_high_bound, ii

    number_list = 1
    number_list(1) = 0

    outer_high_bound = int (sqrt (real (max_value)))
    inner_high_bound = max_value

    do ii = 2, outer_high_bound
      if (number_list(ii) == 1) number_list(ii*ii : max_value : ii) = 0
    end do

  end subroutine sieve_of_eratosthenes

  subroutine print_primes(list_size, prime_list)
    implicit none

    integer, intent(in) :: list_size, prime_list(:) 
    integer :: ii

    do ii = 1, list_size
      if (prime_list(ii) == 1) write(*,*) ii
    end do

  end subroutine print_primes

end program testsieve

! 0.0138 seconds average time (10,000 iterations) (I/O included)
! 2.0481 seconds average time (1,000,000 iterations) (I/O included)

! 0.002 or 0.003 seconds time (10,000 iterations) (Computation only)
! 0.0192 seconds average time (1,000,000 iterations) (Computation only)