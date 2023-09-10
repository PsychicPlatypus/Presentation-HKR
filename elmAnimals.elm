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

main : Html msg
main =
    div []
        [ text (animalSound (Cat "Whiskers" 5))
        , text (animalSound (Dog "Buddy" 3))
        , text (animalSound (Bird "Sparrow"))
        ]