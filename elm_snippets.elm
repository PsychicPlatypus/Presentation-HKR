type Fruit = Apple | Banana | Orange


-- Pattern Matching:

fruitToString : Fruit -> String
fruitToString fruit =
    case fruit of
        Apple ->
            "It's an apple!"
        
        Banana ->
            "It's a banana!"
        
        Orange ->
            "It's an orange!"

main : Html msg
main =
    div [] [ text (fruitToString Apple) ]

