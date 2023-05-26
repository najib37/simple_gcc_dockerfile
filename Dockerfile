
ARG GCC_VERSION=latest
ARG name=a.out exec_args builder=gcc src="*.c *.cpp *.o *.a"

FROM gcc:${GCC_VERSION} AS compiler
SHELL ["/bin/bash" , "-c"]
WORKDIR /usr/home/
COPY . .

ARG builder name src gcc_args=""
ENV builder=${builder} name=${name} gcc_args=${gcc_args} src=${src}

RUN export src=$(ls $src 2> /dev/NULL); $builder $gcc_args -static $src -o $name;

FROM busybox:latest

ARG name exec_args=""
ENV name=${name} exec_args=${exec_args}

WORKDIR /usr/home/
COPY --from=compiler /usr/home/ .
COPY --chmod=755 --from=compiler /usr/home/$name .

CMD ./$name $exec_args
