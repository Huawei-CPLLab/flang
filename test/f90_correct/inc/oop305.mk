#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#


########## Make rule for test oop305  ########

fcheck.o check_mod.mod: $(SRC)/check_mod.f90
	-$(FC) -c $(FFLAGS) $(SRC)/check_mod.f90 -o fcheck.o

oop305.o:  $(SRC)/oop305.f90 check_mod.mod
	@echo ------------------------------------ building test $@
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/oop305.f90 -o oop305.o

oop305: oop305.o fcheck.o
	-$(FC) $(FFLAGS) $(LDFLAGS) oop305.o fcheck.o $(LIBS) -o oop305

oop305.run: oop305
	@echo ------------------------------------ executing test oop305
	oop305
	-$(RM) mod_gen.mod

### TA Expected Targets ###

build: $(TEST)

.PHONY: run
run: $(TEST).run

verify: ; 

### End of Expected Targets ###
