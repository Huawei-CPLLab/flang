!
! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!

!
! Fortran 2008 : The maximum rank has been increased to 15. 
! checking for NORM2(a(:,:,:,:,:,:,:,:), dim = 6)
!
program test
  integer, parameter :: n = 7
  integer, parameter :: dim = 6
  real(8) :: a8(2,2,2,2,2,2,2,2)
  real(8) :: a7(2,2,2,2,2,2,2)
  real(8) :: t(n)
  logical :: result(n), expect(n)
  integer :: i1,i2,i3,i4,i5,i6,i7,i8
 
  expect = .true.
  result = .false.

  forall(i1=1:2,i2=1:2,i3=1:2,i4=1:2,i5=1:2,i6=1:2,i7=1:2,i8=1:2)
    a8(i1,i2,i3,i4,i5,i6,i7,i8) = -0.123456890123456_8 + i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8
  end forall

  a7 = norm2(a8, dim)
 
  t(1) = 13.279274128609085d0
  t(2) = 14.691674302891849d0
  t(3) = 16.104392762900403d0
  t(4) = 17.517352502626220d0
  t(5) = 18.930499495279335d0
  t(6) = 20.343794719281785d0
  t(7) = 21.757209288412511d0

  result(1) = abs((a7(2,1,1,1,1,1,1) - t(1))/t(1)) .lt. 1E-15
  result(2) = abs((a7(2,2,1,1,1,1,1) - t(2))/t(2)) .lt. 1E-15
  result(3) = abs((a7(2,2,2,1,1,1,1) - t(3))/t(3)) .lt. 1E-15
  result(4) = abs((a7(2,2,2,2,1,1,1) - t(4))/t(4)) .lt. 1E-15
  result(5) = abs((a7(2,2,2,2,2,1,1) - t(5))/t(5)) .lt. 1E-15
  result(6) = abs((a7(2,2,2,2,2,2,1) - t(6))/t(6)) .lt. 1E-15
  result(7) = abs((a7(2,2,2,2,2,2,2) - t(7))/t(7)) .lt. 1E-15

  call check(result, expect, n)

end program test
