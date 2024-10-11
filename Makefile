FORTRAN ?= gfortran
GCC ?= gcc
OPT ?= -O3 -march=native -mtune=native -ffast-math -funroll-loops -flto -fPIC

.DEFAULT_GOAL := all

weight_module.o: weight_module.f90
	$(FORTRAN) -c $(OPT) weight_module.f90

llama2.o: llama2.f90
	$(FORTRAN) -c $(OPT) llama2.f90
read_ggml.o: read_ggml.f90
	$(FORTRAN) -c $(OPT) read_ggml.f90 -Izfp/build/modules/

llm: weight_module.o read_ggml.o llama2.o
	$(FORTRAN) $(OPT) weight_module.o read_ggml.o llama2.o -o llm -Wl,-rpath=zfp/build/lib64/ -Lzfp/build/lib64/ -lzFORp -lzfp

load: load.f90
	$(FORTRAN) $(OPT) load.f90 -o load


all: llm

clean:
	rm *.o
