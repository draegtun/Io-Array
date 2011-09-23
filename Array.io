Range

Array := List clone do (
    version := "0.03"

    # index method
    at := method (n,
        if (n type == "Range", n = n asList)
        if (n type == "List", return n map (i, self super(at(i))))
        if (n type == "Number") then (
            if (n < 0, n = n + self size)
        )

        # element (Number, Sequence, ? but not a list) is cloned with ArrayElement has parent proto
        s := self
        element := self super(at(n)) clone
        element setSlot( "elementPosition", n )
        element setSlot( "selfArray", s )
        element do (
            # add setter method to object
            put := method (n,
                selfArray atPut( elementPosition, n )
                self
            )

            << := method (n, put(n))  # shortcut 
        )
        return element
    )

    << := method (n, self super(append(n)))  # shortcut for appending to list/array
    
    # array[index]
    squareBrackets := method (
        result := call message arguments map (n, self at(call sender doMessage(n)))
        if (result size == 1, return result at(0), return result flatten)
    )
)

