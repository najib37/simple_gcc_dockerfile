# simple_gcc_dockerfile

usage:
  put the src files in the docker build context or the Dockerfile won't get built
  than run this command :
    
    docker build --build-arg GCC_VERSION="latest" --build-arg builder=gcc --build-arg gcc_args="-Wall -Wextra" --build-arg name="out" --build-arg exec_args="" -t test:test .
    
>> all the args have a default value if you are compiling a simple file.c it will compile and run without
needing to set none of the args
>> GCC_VERSION := gcc version (default latest)
>> builder := compiler gcc/g++ (default gcc)
>> gcc_args := compiling arguments (default "")
>> name := name of the excutable (default a.out)
>> exec_args := execution argumets (default "")
  
   than run the container using the command :
   
     docker run --rm test:test
