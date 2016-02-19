import Graphics.Element exposing (show)

type alias Item = 
    { 
        quantity : Int,
        name : String
    }

type alias Model = List Item   

test : Model -> Model
test model = 
    model
    
test1 : Int -> Int    
test1 model = 
    model

main =
    show [test (List.map (\i -> {quantity = i, name = "test"}) [1,2,3,4])]