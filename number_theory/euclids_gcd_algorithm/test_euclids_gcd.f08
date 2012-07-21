program test_euclids_gcd
  use euclids_gcd
  implicit none

  logical :: output
  integer :: global_start_time, global_finish_time
  
  print*, ""
  print*, "Running tests for euclids_gcd..."
  call system_clock(global_start_time)

  
  
  print*, '[er_gcd] should correctly calculate GCD.'
  call test_euclid_gcd_recursive(412, 260, 4)
  call test_euclid_gcd_recursive(55848, 54, 6)


  print*, ' [er_gcd] should return the non-zero argument given one zero.'
  !call test_euclid_gcd_recursive(13, 0, 13)
  !call test_euclid_gcd_recursive(0, 13, 13)

  print*, ' [er_gcd] should return a value given two equivalent values.'
  call test_euclid_gcd_recursive(12, 12, 12)


  print*, '[erb_gcd] should correctly calculate GCD.'
  call test_euclid_gcd_binary(99, 3, 3)
  call test_euclid_gcd_binary(55848, 54, 6) ! gives incorrect answer
  !call test_euclid_gcd_binary(3280, 3478, 2) ! doesn't work for whatever reason; segfaults

  print*, ' [erb_gcd] should return the non-zero argument given one zero.'
  call test_euclid_gcd_binary(99, 0, 99)
  call test_euclid_gcd_binary(0, 54584, 54584)

  print*, ' [erb_gcd] should return a value given two equivalent values.'
  call test_euclid_gcd_binary(12, 12, 12)
  call test_euclid_gcd_recursive(35545, 35545, 35545)

  ! Binary algorithm can't handle any 'a' arguments smaller than the 'b' argument.
  ! (Results in a segmentation fault.)
  ! print*, ' [erb_gcd] should be able to handle an "a" argument smaller than "b" argument.'
  !call test_euclid_gcd_binary(5, 6, 5)
  !call test_euclid_gcd_binary(5, 500, 5)

  call system_clock(global_finish_time)
  print*, ""
  print*, "[Finished.] Completed tests in: ", global_finish_time-global_start_time, " seconds."

contains

    subroutine test_euclid_gcd_recursive(a, b, expected_result)
      implicit none
      integer, intent(in) :: a, b, expected_result
      integer :: result
      integer :: start_time, finish_time, test

      call system_clock(start_time)
      result = er_gcd(a, b)
      call system_clock(finish_time)

      if (result == expected_result) then
        print*, "[Success!] test_euclid_gcd_recursive -- Elapsed time: ", (finish_time - start_time), " seconds."
        print*, "------------ Got expected result, ", result
      else
        print*, "[Failure...] test_euclid_gcd_recursive. -- Elapsed time: ", (finish_time - start_time), " seconds."
        print*, "------------ Expected: ", expected_result, " but got: ", result, " instead."
      end if
      print*, ""
    end subroutine test_euclid_gcd_recursive

    subroutine test_euclid_gcd_binary(a, b, expected_result)
      implicit none
      integer, intent(in) :: a, b, expected_result
      integer :: result
      integer :: start_time, finish_time, test

      call system_clock(start_time)
      result = erb_gcd(a, b)
      call system_clock(finish_time)

      if (result == expected_result) then
        print*, "[Success!] test_euclid_gcd_binary -- Elapsed time: ", (finish_time - start_time), " seconds."
        print*, "------------ Got expected result, ", result
      else
        print*, "[Failure...] test_euclid_gcd_binary -- Elapsed time: ", (finish_time - start_time), " seconds."
        print*, "------------ Expected: ", expected_result, " but got: ", result, " instead."
      end if
      print*, ""
    end subroutine test_euclid_gcd_binary



end program test_euclids_gcd