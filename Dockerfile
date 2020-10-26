FROM gcc:7.2

RUN apt-get update && apt-get install -y git astyle

#
# Download and extract compilers
#
RUN mkdir -p /gcc_9_2_1
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 \
    && tar -xvf gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 --strip-components=1 -C /gcc_9_2_1 \
    && rm gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2

#
# Set the compiler variables
#
ENV GCC_COMPILER_9_2_1 /gcc_9_2_1/bin

#
# Set up the compiler path to the latest version
#
ENV PATH PATH=${PATH}:${GCC_COMPILER_9_2_1}

#
# Set up the Astyle path
#
ENV PATH PATH=${PATH}:/astyle/build/gcc/bin
RUN arm-none-eabi-gcc --version
RUN mkdir /project
WORKDIR /project
