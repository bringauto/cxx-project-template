# Project Name 

Short project description 

- what it does?
- Short usage example

# Requirements 

Following dependencies must be installed on the host system

- dependency1 [>= version]
- dependency2

# Run 

./ProjectName --requiredArg <arg_val> [--optional_arg <arg_val> ...]

# Program Arguments 

-a | --arg1: description


# Build 

```
mkdir -p _build && cd _build
cmake ../
make -j 8
```

## CMake arguments 

- argument 1
- argument 2

## Tests 

Enable BRINGAUTO_TESTS in cmake and run ctests

```
cmake -DBRINGAUTO_TESTS=ON ../
make
ctest
```