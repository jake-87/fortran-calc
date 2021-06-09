# fortran-calc
simple reverse poland calculator in fortran.

## How to build:
Simply download the source, and do a `bmake`. This will compile the software, and will place the executable as fcalc in the top level dir of this project.

Requirements:
* `gfortran`
* `bmake`

## avalible operators:
* `+`
* `-`
* `*`
* `/`
* `.sin`
* `.cos`
* `.tan`
* ^ Self Explanitory
* `#` 
* ^ Inverse square, works the same as a square root
* `.rsin`
* `.rcos`
* `.rtan`
* ^ Same as sin, cos, tan but with radians instead of degrees.
* `.asin`
* `.acos`
* `.atan`
* ^ Arc versions of sin, cos, tan.
* `.rasin`
* `.racos`
* `.ratan`
* ^ Same as arcsin, cos, tan but in radians.
* `.loge`
* `.log10`
* `.log`
* ^ Calculates logs. The `.log` command works like this: `2 8 log`, calculating log <sub>2</sub> (8).
* `.pi` 
* `.tau`
* `.gr` (Golden Ratio)
* `.e`
* ^ Pushes the corresponding irrational number onto the stack.



## avalible commands:
* `p`
* Print current top of stack
* `r`
* Reset stack
* `pop`
* Remove top of stack
* `pp`
* Print current pointer to top of stack
* `q`
* Quits
* `help`
* Prints help message.
