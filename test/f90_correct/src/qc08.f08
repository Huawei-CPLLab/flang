! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
! test for plus operation of quad complex.

program test
  integer, parameter :: n = 8
  complex(16) :: c1, c2, rst1, rst2
  complex(16) :: rst3 = (15.213513214321532163123412431412417090_16, 9.1214985738130981578153850981181281123_16) +&
                        (7.1231253324643254512433153216416124311_16, 12.241902481095124109198598327978737125_16)
  complex(16), parameter :: rst4 = (1.2135132143215321631234124311241709083_16, 2.1298419028097583091849810928910931241_16) +&
                                   (27.123125334246432545124335326416124311_16, 13.541305991830598109284908129842814809_16)
  real(16) :: result(n), expect(n)

  c1 = (42.58879788522658767867845243213578_16, -7.3387123548975562114863159753156_16)
  c2 = (-13.78966233687994235485669841336698_16, 71.233687476876737257454577868787_16)

  rst1 = c1 + c2
  rst2 = c1 + (-1.378966233687994235485669841336698_16, 7.1233687476876737257454577868787_16)

  expect(1) = 28.7991355483466453238217540187687966_16
  expect(2) = 63.8949751219791810459682618934713945_16
  expect(3) = 41.2098316515385934431927825907990805_16
  expect(4) = -0.215343607209882485740858188436900064_16
  expect(5) = 22.3366385467858576143667277530540291_16
  expect(6) = 21.3634010549082222670139834260968625_16
  expect(7) = 28.3366385485679647082477477575402948_16
  expect(8) = 15.6711478946403564184698892227339065_16

  result(1) = rst1%re
  result(2) = rst1%im
  result(3) = rst2%re
  result(4) = rst2%im
  result(5) = rst3%re
  result(6) = rst3%im
  result(7) = rst4%re
  result(8) = rst4%im

  do i = 1, n
    if (abs((result(i) - expect(i)) / expect(i)) .gt. 1E-33_16) STOP i
  enddo

  print *, 'PASS'
end
