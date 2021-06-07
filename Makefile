target = "fcalc"
FFLAGS += '-fdec-math' '-Wall' '-Wextra'
UNAME := $(shell uname)

ifeq ($(UNAME), FreeBSD)
FFLAGS += '-static' '-fPIC' 
endif 
PHONY:
	make compile
	make run
compile:
	gfortran src/*.f90 -o $(target) $(FFLAGS)
run:
	./$(target)
clean:
	rm -f $(target) *.mod
gc:
	make clean
	git add .
	git commit
