#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test ch08  ########


ch08: run
	

build:  $(SRC)/ch08.f90
	-$(RM) ch08.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/ch08.f90 -o ch08.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) ch08.$(OBJX) check.$(OBJX) $(LIBS) -o ch08.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test ch08
	ch08.$(EXESUFFIX)

verify: ;

ch08.run: run

