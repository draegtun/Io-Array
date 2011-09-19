#!/usr/bin/env io

Array

array := Array clone with("zero", "one", "two", "three", "four")

array at(2) println

array[3] println
array[3,0,1] println
array[list(2,3)] println
array[list(1)] println
array[list(2,3), 0, list(1)] println

#array[ Message  ] println