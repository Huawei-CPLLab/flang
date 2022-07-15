#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test ieee arithmetic ########


qp44: run
	

build:  $(SRC)/qp44.f08
	-$(RM) qp44.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC)  -c $(FFLAGS) $(LDFLAGS) $(SRC)/qp44.f08 -o qp44.$(OBJX)
	-$(FC)  $(FFLAGS) $(LDFLAGS) qp44.$(OBJX) check.$(OBJX) $(LIBS) -o qp44.$(EXESUFFIX)


run: 
	@echo ------------------------------------ executing test qp44 
	qp44.$(EXESUFFIX)

verify: ;

