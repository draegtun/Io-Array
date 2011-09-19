Range

Array := List clone do (
    
    at := method (n,
        if (n type == "Range", n = n asList)
        if (n type == "List",
            return n map (i, self super(at(i))),
            return self super(at(n))
        )
    )
    
    squareBrackets := method (
        result := call message arguments map (n, self at(call sender doMessage(n)))
        if (result size == 1, return result at(0), return result flatten)
    )
)

