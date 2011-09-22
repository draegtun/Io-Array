Range

ArrayElement := Number clone do (

    # amend element
    put := method (n,
        selfArray atPut( elementPosition, n )
        self
    )

    << := method (n, put(n))  # shortcut
)

Array := List clone do (
    version := "0.02"

    # index method
    at := method (n,
        if (n type == "Range", n = n asList)
        if (n type == "List", return n map (i, self super(at(i))))
        if (n type == "Number") then (
            if (n < 0, n = n + self size)
        )

        # element (Number object) is cloned with ArrayElement has parent proto
        s := self
        element := self super(at(n)) clone
        element prependProto( ArrayElement )
        element setSlot( "elementPosition", n )
        element setSlot( "selfArray", s )
        return element
    )

    << := method (n, self super(append(n)))  # shortcut for appending to list/array
    
    # array[index]
    squareBrackets := method (
        result := call message arguments map (n, self at(call sender doMessage(n)))
        if (result size == 1, return result at(0), return result flatten)
    )
)

