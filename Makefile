.PHONY:
	make compile
	make run
compile:
	gfortran src/*.f90 -o main
run : main
	./main
clean:
	rm -f main *.mod
