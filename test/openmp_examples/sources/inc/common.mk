#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

# compile, link, run a .f test

build:
	@$(RM) -f $(TEST).$(EXE) core.* *.exe
	@echo ------------------------------------ building test $@
	$(FC) -c $(FFLAGS) $(SRC)/sources/$(TEST).f -o $(TEST).$(OBJX)
	$(FC) $(TEST).$(OBJX) $(LDFLAGS) -o $(TEST).$(EXE)

run:
	@echo ------------------------------------ executing test $(TEST)
	$(TEST).$(EXE)
	@echo PASS

verify: ;

