target = "fcalc"
flags = '-fdec-math' '-Wall' '-Wextra'
PHONY:
	make compile
	make run
compile:
	gfortran src/*.f90 -o $(target) $(flags)
run:
	./$(target)
clean:
	rm -f $(target) *.mod
gc:
	git add .
	git commit
