# gmp
This library provides a higher level abstraction over [GNU's MP library](https://gmplib.org). \
Using this package, you can create integers with an arbitrary size beyond the traditional 8-bit, 16-bit, 32-bit and 64-bit limits, granted that you have enough memory. \
It automatically handles the destruction of objects and their allocation, allowing you to safely* use this C library.

The bindings are not complete yet, so only a portion of the entire library is available and safely wrapped.

# Example
```nim
import gmp

let a = initBigInt(20) # We can represent this number as a regular Nim type, so we can put it as-is.
let b = initBigInt("234832843284823423483284832748732487324824234") # We cannot represent this large number as a Nim type, so we'll put it in as a string and let gmp handle the parsing.

# We can multiply the two!
echo a * b

# We can also multiply bigints with normal Nim integers, granted that they are signed.
echo a * 3'u
```

# Dependencies
This library has no dependencies on any Nim package, but it requires you to install the `gmp` library, preferrably through your system's package manager.

# Tested Platforms
I have only tested this library on a 64-bit x86 Linux system.
