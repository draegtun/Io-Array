Basic Array object cloned from the List object.

Simple synopsis:

  array := Array with("zero", "one", "two", "three", "four")

  array[4]              # => "four"
  array[1, 3, 0]        # => list("one", "three", "zero")
  array[1 to(3)]        # => list("one", "two", "three")
  array << "five"       # => list("zero", "one", "two", "three", "four", "five")
  array[5] << "FIVE"    # => list("zero", "one", "two", "three", "four", "FIVE")

From playing around with small acorns do big wonky trees grow :)

/I3az/
