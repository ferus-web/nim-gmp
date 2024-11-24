import std/[options, unittest]
import gmp

suite "gmp":
  test "convert bigints to string":
    let x = initBigInt(323243288)
    check $x == "323243288"

    let y = initBigInt("838272391238548239238429192304823482323")
    check $y == "838272391238548239238429192304823482323"

  test "comparisons":
    let x = initBigInt(1337)
    check x >= 1337

    let y = initBigInt("2343284328748732487324")
    check y > uint64.high

    let z = initBigInt("34883483")
    check z < uint64.high

  test "convert bigints to ints/uints":
    let x = initBigInt(1337)
    check x.getInt().get() == 1337
    check x.getUint().get() == 1337'u

    let y = initBigInt("23488324823427348732487")
    check y.getInt().isNone
    check y.getUint().isNone

    check y.getInt() == none(int)
    check y.getUint() == none(uint)

  test "addition":
    let x = initBigInt(10)
    let y = initBigInt(20)

    check x + y == initBigInt(30)

    let p = initBigInt("234873287432874873248732878328")
    let q = initBigInt(1)
    
    check p + q == initBigInt("234873287432874873248732878329")

  test "subtraction":
    let x = initBigInt(20)
    let y = initBigInt(10)

    check x - y == initBigInt(10)

    let p = initBigInt("324732743274732472343274832829129")
    let q = initBigInt(1)

    check p - q == initBigInt("324732743274732472343274832829128")

  test "addition with primitives":
    let x = initBigInt("1300")
    let y = 37'u

    check x + y == initBigInt("1337")

    let p = 1300'u
    let q = initBigInt("37")

    check q + p == initBigInt("1337")

  test "subtraction with primitives":
    let x = initBigInt(20)
    let y = 10'u

    check x - y == initBigInt(10)

    let p = initBigInt("324732743274732472343274832829129")
    let q = 1'u

    check p - q == initBigInt("324732743274732472343274832829128")

  test "multiplication":
    let x = initBigInt(10)
    let y = initBigInt("10")

    check x * y == initBigInt(100)

    let p = initBigInt("23874328743287487324873287324")
    let q = initBigInt("234832483248348234")

    check p * q == initBigInt("5606467904673617612661908554097010672689985816")

  test "multiplication with primitives":
    let x = initBigInt("10")
    let y = 10

    check x * y == initBigInt("100")

    let p = initBigInt("23432423483274873248732723432843284732743287483248")
    let q = 2

    check p * q == initBigInt("46864846966549746497465446865686569465486574966496")
