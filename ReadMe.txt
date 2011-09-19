Basic Array object cloned from the List object.

Simple synopsis:

  array := Array with("zero", "one", "two", "three", "four")

  array[4]        # => 4
  array[1, 3, 0]  # => list("one", "three", "zero")
  array[1 to(3)]  #  => list("one", "two", "three")