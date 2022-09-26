! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
! test for constant complex(16) convert to integer(4)

program test
  integer, parameter :: n = 5
  integer, parameter :: m = n * 4
  complex(16) :: c_16(n)
  integer(4) :: result(m), expect(m)
  integer(4), parameter :: rst1 = (-2147483648.0_16, -2147483648.0_16)
  integer(4), parameter :: rst2 = (-7.123456789012345678901234567890123456789_16,&
                                   -7.123456789012345678901234567890123456789_16)
  integer(4), parameter :: rst3 = (0.0_16, 0.0_16)
  integer(4), parameter :: rst4 = (77.123456789012345678901234567890123456789_16,&
                                   77.123456789012345678901234567890123456789_16)
  integer(4), parameter :: rst5 = (2147483647.0_16, 2147483647.0_16)
  integer(4) :: rst6 = (-2147483648.0_16, -2147483648.0_16)
  integer(4) :: rst7 = (-7.123456789012345678901234567890123456789_16,&
                                   -7.123456789012345678901234567890123456789_16)
  integer(4) :: rst8 = (0.0_16, 0.0_16)
  integer(4) :: rst9 = (77.123456789012345678901234567890123456789_16,&
                                   77.123456789012345678901234567890123456789_16)
  integer(4) :: rst10 = (2147483647.0_16, 2147483647.0_16)

  expect(1) = -2147483648
  expect(2) = -7
  expect(3) = 0
  expect(4) = 77
  expect(5) = 2147483647
  expect(6) = -2147483648
  expect(7) = -7
  expect(8) = 0
  expect(9) = 77
  expect(10) = 2147483647
  expect(11) = -2147483648
  expect(12) = -7
  expect(13) = 0
  expect(14) = 77
  expect(15) = 2147483647
  expect(16) = -2147483648
  expect(17) = -7
  expect(18) = 0
  expect(19) = 77
  expect(20) = 2147483647

  c_16(1) = (-2147483648.0_16, -2147483648.0_16)
  c_16(2) = (-7.123456789012345678901234567890123456789_16,&
             -7.123456789012345678901234567890123456789_16)
  c_16(3) = (0.0_16, 0.0_16)
  c_16(4) = (77.123456789012345678901234567890123456789_16,&
             77.123456789012345678901234567890123456789_16)
  c_16(5) = (2147483647.0_16, 2147483647.0_16)

  do i = 1, n
    result(i) = c_16(i)
  enddo

  result(n+1) = rst1
  result(n+2) = rst2
  result(n+3) = rst3
  result(n+4) = rst4
  result(n+5) = rst5
  result(n+6) = (-2147483648.0_16, -2147483648.0_16)
  result(n+7) = (-7.123456789012345678901234567890123456789_16,&
                 -7.123456789012345678901234567890123456789_16)
  result(n+8) = (0.0_16, 0.0_16)
  result(n+9) = (77.123456789012345678901234567890123456789_16,&
                 77.123456789012345678901234567890123456789_16)
  result(n+10) = (2147483647.0_16, 2147483647.0_16)
  result(n+11) = rst6
  result(n+12) = rst7
  result(n+13) = rst8
  result(n+14) = rst9
  result(n+15) = rst10

  do i = 1, m
    if (result(i) .ne. expect(i)) STOP i
  enddo

  print *, 'PASS'

end program