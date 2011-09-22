Range

ArrayElement := Number clone do (

    put := method (n,
        selfArray atPut( elementPosition, n )
        self
    )
)

Array := List clone do (
    version := "0.01"
    
    at := method (n,
        if (n type == "Range", n = n asList)
        if (n type == "List", return n map (i, self super(at(i))))
        if (n type == "Number") then (
            if (n < 0, n = n + self size)
        )

        # element
        s := self
        element := self super(at(n)) clone
        element prependProto( ArrayElement )
        element setSlot( "elementPosition", n )
        element setSlot( "selfArray", s )
        return element
    )
    
    squareBrackets := method (
        result := call message arguments map (n, self at(call sender doMessage(n)))
        if (result size == 1, return result at(0), return result flatten)
    )
)

