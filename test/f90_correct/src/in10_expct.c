/*
 * Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
 * See https://llvm.org/LICENSE.txt for license information.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 *
 * Part of the f2008 erfc intrinsic test
 */

#include <stdio.h>
#include <math.h>

void
get_expected_f(float src[], float expct[], int n)
{
    int i;

    for(i= 0; i <n; i++ ) {
#ifdef  WIN64
        expct[i] = erfc(src[i]);
#else
        expct[i] = erfcf(src[i]);
#endif
        /*printf("%d) erfcf(%e) = %e\n",i, src[i], expct[i]);*/
    }
}

void
get_expected_d(double src[], double expct[], int n)
{
    int i;

    for(i= 0; i <n; i++ ) {
        expct[i] = erfc(src[i]);
        /*printf("%d) erfc(%e) = %e\n",i, src[i], expct[i]);*/
    }
}
