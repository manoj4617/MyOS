# MyOS

MyOS is a simple operating system that is being developed from scratch.

## Getting Started

These instructions will help you get a copy of the project up and running on your local machine.

### Prerequisites

* A computer running Linux or macOS
* A cross-compiler for your target architecture

To build MyOS, you will need to install the following software:

* NASM (The Netwide Assembler)
* GCC (The GNU Compiler Collection)

### Installing NASM

NASM can be installed using the package manager for your Linux distribution. For example, on Ubuntu, you can install NASM using the following command:

sudo apt-get install nasm

Alternatively, you can download the NASM source code from the [NASM website](https://www.nasm.us/) and build it from source.

### Installing GCC

GCC can also be installed using the package manager for your Linux distribution. For example, on Ubuntu, you can install GCC using the following command:

sudo apt-get install build-essential


This will install GCC, as well as other essential build tools such as make and libc.

### Building MyOS

1. Clone the repository:

    git clone https://github.com/manoj4617/MyOS.git


2. Build the operating system using the cross-compiler:

    make

3. Run the operating system using an emulator such as QEMU:

    make run