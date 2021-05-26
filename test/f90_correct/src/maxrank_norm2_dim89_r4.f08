!
! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!

!
! Fortran 2008 : The maximum rank has been increased to 15. 
! checking for NORM2(a(:,:,:,:,:,:,:,:,:,:,:,:,:,:,:), dim = 12)
!
program test
  integer, parameter :: n = 14
  integer, parameter :: dim = 12
  real(4) :: a15(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2)
  real(4) :: a14(2,2,2,2,2,2,2,2,2,2,2,2,2,2)
  real(4) :: t(n)
  logical :: result(n), expect(n)
  integer :: i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15
 
  expect = .true.
  result = .false.

  forall(i1=1:2,i2=1:2,i3=1:2,i4=1:2,i5=1:2,i6=1:2,i7=1:2,i8=1:2,i9=1:2,i10=1:2,i11=1:2,i12=1:2,i13=1:2,i14=1:2,i15=1:2)
    a15(i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15) = 0.123456_4 + i1 + i2 + i3 + i4 + i5 + i6 +&
    &i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15
  end forall

  a14 = norm2(a15, dim)
 
  t(1) = 23.5197468
  t(2) = 24.9333572
  t(3) = 26.3470325
  t(4) = 27.7607632
  t(5) = 29.1745396
  t(6) = 30.5883579
  t(7) = 32.0022087
  t(8) = 33.4160919
  t(9) = 34.8300018
  t(10) = 36.2439346
  t(11) = 37.6578903
  t(12) = 39.0718613
  t(13) = 40.4858551
  t(14) = 41.8998604

  result(1) = abs((a14(2,1,1,1,1,1,1,1,1,1,1,1,1,1) - t(1))/t(1)) .lt. 1E-6
  result(2) = abs((a14(2,2,1,1,1,1,1,1,1,1,1,1,1,1) - t(2))/t(2)) .lt. 1E-6
  result(3) = abs((a14(2,2,2,1,1,1,1,1,1,1,1,1,1,1) - t(3))/t(3)) .lt. 1E-6
  result(4) = abs((a14(2,2,2,2,1,1,1,1,1,1,1,1,1,1) - t(4))/t(4)) .lt. 1E-6
  result(5) = abs((a14(2,2,2,2,2,1,1,1,1,1,1,1,1,1) - t(5))/t(5)) .lt. 1E-6
  result(6) = abs((a14(2,2,2,2,2,2,1,1,1,1,1,1,1,1) - t(6))/t(6)) .lt. 1E-6
  result(7) = abs((a14(2,2,2,2,2,2,2,1,1,1,1,1,1,1) - t(7))/t(7)) .lt. 1E-6
  result(8) = abs((a14(2,2,2,2,2,2,2,2,1,1,1,1,1,1) - t(8))/t(8)) .lt. 1E-6
  result(9) = abs((a14(2,2,2,2,2,2,2,2,2,1,1,1,1,1) - t(9))/t(9)) .lt. 1E-6
  result(10) = abs((a14(2,2,2,2,2,2,2,2,2,2,1,1,1,1) - t(10))/t(10)) .lt. 1E-6
  result(11) = abs((a14(2,2,2,2,2,2,2,2,2,2,2,1,1,1) - t(11))/t(11)) .lt. 1E-6
  result(12) = abs((a14(2,2,2,2,2,2,2,2,2,2,2,2,1,1) - t(12))/t(12)) .lt. 1E-6
  result(13) = abs((a14(2,2,2,2,2,2,2,2,2,2,2,2,2,1) - t(13))/t(13)) .lt. 1E-6
  result(14) = abs((a14(2,2,2,2,2,2,2,2,2,2,2,2,2,2) - t(14))/t(14)) .lt. 1E-6
  
  call check(result, expect, n)

end program test
