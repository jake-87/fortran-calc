target = "fcalc"
FFLAGS += '-fdec-math' '-Wall' '-Wextra'
UNAME != $(shell uname)
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
mod:
	.for i in src/*
		gfortran -c src/$i -o ../
		rm *.o
	.endfor
