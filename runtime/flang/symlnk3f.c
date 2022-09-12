/*
 * Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
 * See https://llvm.org/LICENSE.txt for license information.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 *
 */

/* clang-format off */

/*	symlnk3f.c - Implements LIB3F symlnk subprogram.  */

#ifndef WINNT

#include "io3f.h"
#include "ent3f.h"
#include "utils3f.h"

int ENT3F(SYMLNK, symlnk)(DCHAR(n1), DCHAR(n2) DCLEN(n1) DCLEN(n2))
{
  char *p1, *p2;
  int i;

  p1 = __fstr2cstr(CADR(n1), CLEN(n1));
  p2 = __fstr2cstr(CADR(n2), CLEN(n2));

  if ((i = symlink(p1, p2)))
    i = __io_errno();

  __cstr_free(p1);
  __cstr_free(p2);

  return i;
}

#endif /* !WINNT */
