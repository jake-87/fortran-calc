target = "fcalc"
FFLAGS += '-fdec-math' '-Wall' '-Wextra'
PHONY:
	make compile
	make run
compile:
	make clean
	make mod
	gfortran src/*.f90 -o $(target) $(FFLAGS)
run:
	./$(target)
clean:
	rm -f $(target) *.mod
gc:
	make clean
	git add .
	git commit
mod:
	gfortran -c src/*.f90
	rm *.o
