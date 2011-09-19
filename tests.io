#!/usr/bin/env io

Array

ArrayTest := UnitTest clone do (
    setUp := method (
        self array := Array with("zero", "one", "two", "three", "four")
    )
    
    testBasic := method (
        assertEquals( array at(2), "two" )
        assertEquals( array[2],    "two" )
    )
    
    testList := method (
        assertEquals( array[3,0,1], list("three", "zero", "one") )
        assertEquals( array[list(2, 3)], list("two", "three") )
        assertEquals( array[list(1)], list("one") )
        assertEquals( array[list(2,3), 0, list(1)], list("two", "three", "zero", "one") )
    )
    

    
    //tearDown := method ()
)

ArrayTest run
