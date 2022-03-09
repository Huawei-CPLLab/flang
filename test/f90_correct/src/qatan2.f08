! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
! test for intrinsic atan2 take quad precision argument.

program test
  implicit none
  integer, parameter :: n = 16
  integer, parameter :: m = n * 4
  integer, parameter :: k = 16
  real(k), parameter :: offset = 0.123456789012345678901234567890123456_k
  real(k), parameter :: q_tol = 5e-33_k
  real(k), parameter :: radians(n) = (/ &
    0.00000000000000000000000000000000000_k, &
    0.577350269189625764509148780501957505_k, &
    1.00000000000000000000000000000000000_k, &
    1.73205080756887729352744634150587251_k, &
    23063235587371561727661983816373740.0_k, &
    -1.73205080756887729352744634150587213_k, &
    -1.00000000000000000000000000000000019_k, &
    -0.577350269189625764509148780501957216_k, &
    -0.867181013012378102479704402604335225E-34_k, &
    0.577350269189625764509148780501957505_k, &
    0.999999999999999999999999999999999807_k, &
    1.73205080756887729352744634150587290_k, &
    7687745195790520575887327938791246.00_k, &
    -1.73205080756887729352744634150587097_k, &
    -1.00000000000000000000000000000000039_k, &
    -0.577350269189625764509148780501957312_k &
  /)
  integer :: i
  real(k), dimension(n) :: arg
  real(k) :: rst(n) = atan2(radians, radians+offset)
  real(k), parameter :: rst_p(n) = atan2(radians, radians+offset)
  real(k) :: result(m), expect(m)

  expect(1:n) = (/ &
  0.00000000000000000000000000000000000_k, &
  0.689107207144673518354109178485481292_k, &
  0.727324004325668077618892278358296596_k, &
  0.750999255722940315461966896075525389_k, &
  0.785398163397448309615660845819875699_k, &
  -2.31925532485632839641729328974945982_k, &
  -2.29049968926822013068094835014549876_k, &
  -2.23704514785518288519627930703430828_k, &
  -7.02416626861775905396718678918795945E-0034_k, &
  0.689107207144673518354109178485481292_k, &
  0.727324004325668077618892278358296596_k, &
  0.750999255722940315461966896075525389_k, &
  0.785398163397448309615660845819875699_k, &
  -2.31925532485632839641729328974945982_k, &
  -2.29049968926822013068094835014549876_k, &
  -2.23704514785518288519627930703430828_k &
  /)

  expect(n+1:2*n) = expect(1:n)
  expect(2*n+1:3*n) = expect(1:n)
  expect(3*n+1:4*n) = expect(1:n)

  arg = radians
  result(1:n) = atan2(arg, arg+offset)
  result(n+1:2*n) = atan2(radians, radians+offset)
  result(2*n+1:3*n) = rst
  result(3*n+1:4*n) = rst_p
  do i = 1, m
    if (expect(i) .eq. 0.0_k) then
      if (result(i) .ne. expect(i)) STOP i
    else
      if (abs((result(i) - expect(i)) / expect(i)) .gt. q_tol) STOP i
    endif
  enddo

  print *, 'PASS'

end
