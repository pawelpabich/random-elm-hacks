module Product where

import Html exposing (..)
import Html.Attributes exposing (style, value)
import Html.Events exposing (on, onClick, targetValue)
import String

type alias Location = 
    { 
        quantity : Int,
        name : String
    }
    
type ACTION = Increment | Decrement | Type String

update action model = 
    case action of 
        Increment -> { 
                        model |
                            quantity = model.quantity + 1
                    }
        Decrement -> { 
                        model |
                            quantity = model.quantity - 1
                     }
        Type text -> {
                        model | 
                            quantity = model.quantity + (String.toInt text|> Result.toMaybe |> Maybe.withDefault 0)
                    }

view address model = 
    div []
        [ span [] [text model.name],          
          input  [toString model.quantity |> value, on "input" targetValue (Signal.message address << Type)] [], 
          button [onClick address Increment] [text "+"],
          button [onClick address Decrement] [text "-"]
        ]
            
          