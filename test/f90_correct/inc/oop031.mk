#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#


########## Make rule for test oop031  ########

fcheck.o check_mod.mod: $(SRC)/check_mod.f90
	-$(FC) -c $(FFLAGS) $(SRC)/check_mod.f90 -o fcheck.o

oop031.o:  $(SRC)/oop031.f90 check_mod.mod
	@echo ------------------------------------ building test $@
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/oop031.f90 -o oop031.o

oop031: oop031.o fcheck.o
	-$(FC) $(FFLAGS) $(LDFLAGS) oop031.o fcheck.o $(LIBS) -o oop031

oop031.run: oop031
	@echo ------------------------------------ executing test oop031
	oop031
	-$(RM) tmod.mod

### TA Expected Targets ###

build: $(TEST)

.PHONY: run
run: $(TEST).run

verify: ; 

### End of Expected Targets ###
