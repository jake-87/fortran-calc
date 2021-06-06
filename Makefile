PHONY:
	make compile
	make run
	make clean
compile:
	gfortran src/*.f90 -o fcalc
run : fcalc
	./fcalc
clean:
	rm -f fcalc *.mod
