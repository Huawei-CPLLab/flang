! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
! test MAXVAL intrinsic with quad-precision arguments

program p
  integer, parameter :: n = 11
  real(16), parameter :: init1 = maxval((/1.012345678901234567890123456789_16 , &
                                          1.012345678901234567890123456790_16 , &
                                          1.012345678901234567890123456788_16/))
  real(16), parameter :: init2 = maxval((/-1.012345678901234567890123456789_16 , &
                                          -1.012345678901234567890123456790_16 , &
                                          -1.012345678901234567890123456788_16/))

  integer :: rslts(n), expect(n)
  real(16), dimension(3, 2, 4) :: ra
  real(16) :: tmp, cma, crma1(2, 4), crma2(3, 4), crma3(3, 2), crma4(3, 2)
  real(16), dimension(0) :: rank_zero
  !
  ! Input data
  data ra / 1.012345678901234567890123456781_16, 1.012345678901234567890123456783_16, &
            1.012345678901234567890123456785_16, 1.012345678901234567890123456782_16, &
            1.012345678901234567890123456784_16, 1.012345678901234567890123456786_16, &
            1.012345678901234567890123456780_16, 1.012345678901234567890123456782_16, &
            1.012345678901234567890123456784_16, 1.012345678901234567890123456781_16, &
            1.012345678901234567890123456783_16, 1.012345678901234567890123456785_16, &
            1.012345678901234567890123456779_16, 1.012345678901234567890123456781_16, &
            1.012345678901234567890123456783_16, 1.012345678901234567890123456780_16, &
            1.012345678901234567890123456782_16, 1.012345678901234567890123456784_16, &
            1.012345678901234567890123456778_16, 1.012345678901234567890123456780_16, &
            1.012345678901234567890123456782_16, 1.012345678901234567890123456779_16, &
            1.012345678901234567890123456781_16, 1.012345678901234567890123456783_16 /
  !
  ! Result check data
  !
  data cma / 1.012345678901234567890123456786_16 /
  data crma1 / 1.012345678901234567890123456785_16, 1.012345678901234567890123456786_16, &
               1.012345678901234567890123456784_16, 1.012345678901234567890123456785_16, &
               1.012345678901234567890123456783_16, 1.012345678901234567890123456784_16, &
               1.012345678901234567890123456782_16, 1.012345678901234567890123456783_16 /

  data crma2 / 1.012345678901234567890123456782_16, 1.012345678901234567890123456784_16, &
               1.012345678901234567890123456786_16, 1.012345678901234567890123456781_16, &
               1.012345678901234567890123456783_16, 1.012345678901234567890123456785_16, &
               1.012345678901234567890123456780_16, 1.012345678901234567890123456782_16, &
               1.012345678901234567890123456784_16, 1.012345678901234567890123456779_16, &
               1.012345678901234567890123456781_16, 1.012345678901234567890123456783_16 /

  data crma3 / 1.012345678901234567890123456781_16, 1.012345678901234567890123456783_16, &
               1.012345678901234567890123456785_16, 1.012345678901234567890123456782_16, &
               1.012345678901234567890123456784_16, 1.012345678901234567890123456786_16 /

  rslts = 0
  expect = 1

  !initializition
  if (init1 .eq. 1.012345678901234567890123456790_16) rslts(1) = 1
  if (init2 .eq. -1.012345678901234567890123456788_16) rslts(2) = 1

  !boundary
  tmp = maxval((/-huge(1.0_16), -huge(1.0_16)/))
  if (tmp .eq. -huge(1.0_16)) rslts(3) = 1

  tmp = maxval((/huge(1.0_16), huge(1.0_16)/))
  if (tmp .eq. huge(1.0_16)) rslts(4) = 1

  tmp = maxval((/tiny(1.0_16), tiny(1.0_16)/))
  if (tmp .eq. tiny(1.0_16)) rslts(5) = 1

  tmp = maxval((/epsilon(1.0_16), epsilon(1.0_16)/))
  if (tmp .eq. epsilon(1.0_16)) rslts(6) = 1

  !functional verificatiion
  if (maxval(ra) .eq. cma) rslts(7) = 1
  if (all(maxval(ra, dim = 1) .eq. crma1)) rslts(8) = 1
  if (all(maxval(ra, dim = 2) .eq. crma2)) rslts(9) = 1
  if (all(maxval(ra, dim = 3) .eq. crma3)) rslts(10) = 1

  !mask=false
  crma4 = reshape((/-huge(1.0_16), -huge(1.0_16), -huge(1.0_16), &
                    -huge(1.0_16), -huge(1.0_16), -huge(1.0_16)/), shape(crma4))
  if (all(maxval(ra, dim = 3, mask = .false.) .eq. crma4)) rslts(11) = 1

  call check(rslts, expect, n)
end program p
