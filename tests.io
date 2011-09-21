#!/usr/bin/env io

Array

ArrayTest := UnitTest clone do (
    setUp := method (
        self array := Array with("zero", "one", "two", "three", "four")
    )
    
    testBasic := method (
        assertEquals( array at(2), "two" )
        assertEquals( array[2],    "two" )
        
        # check it is evalulated in senders context!
        baz := 2;
        assertEquals( array[baz], "two" )
        assertEquals( array[baz + 1], "three" )
        assertEquals( array[baz + 1, 0], list("three", "zero") )
        assertEquals( array[list(baz)], list("two") )
    )
    
    testList := method (
        assertEquals( array[3,0,1], list("three", "zero", "one") )
        assertEquals( array[list(2, 3)], list("two", "three") )
        assertEquals( array[list(1)], list("one") )  // hmmmm should I leave like this?
        assertEquals( array[list(2,3), 0, list(1)], list("two", "three", "zero", "one") )
    )
    
    testRange := method (
        assertEquals( array[ 1 to(3) ], list("one", "two", "three") )
        assertEquals( array[ 1 to(3), 0, 3 to(4), list(0,2) ], 
            list("one", "two", "three", "zero", "three", "four", "zero", "two") )
        assertEquals( array[ 1 to(1) ], list("one") )   # Range index always returns a list()
    )
    
    testClone := method (
        anotherArray    := Array with(0, 1, 2, 3, 4)
        andAnotherArray := Array with(10, 11, 12, 13, 14)
        assertEquals( anotherArray[2], 2 )
        assertEquals( andAnotherArray[3], 13 )
        
        # and finally lets check original array has mutated!
        assertEquals( array, list("zero", "one", "two", "three", "four") )
    )

    testMinus := method (
        assertEquals( array[-1],    "four"  )
        assertEquals( array at(-2), "three" )
        assertEquals( array[-1, 0, -2, 4], list("four", "zero", "three", "four") )
        # assertEquals( array[list(-1, -2)], list("four", "three") ) - list() doesn't do minus indexes!
    )
    
    //tearDown := method ()
)

ArrayTest run
