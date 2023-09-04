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


type Animal
    = Cat String Int
    | Dog String Int
    | Bird String

animalSound : Animal -> String
animalSound animal =
    case animal of
        Cat name age ->
            "Meow, I'm " ++ name ++ " and I'm " ++ String.fromInt age ++ " years old!"

        Dog name age ->
            "Woof, I'm " ++ name ++ " and I'm " ++ String.fromInt age ++ " years old!"

        Bird species ->
            "Chirp, I'm a " ++ species ++ "!"

main1 : Html msg
main1 =
    div []
        [ text (animalSound (Cat "Whiskers" 5))
        , text (animalSound (Dog "Buddy" 3))
        , text (animalSound (Bird "Sparrow"))
        ]
