module Product where

import Html exposing (..)
import Html.Attributes exposing (style, value)
import Html.Events exposing (on, onClick, targetValue)

type alias Location = 
    { 
        quantity : Int,
        name : String
    }
    
type ACTION = Increment | Decrement

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

view address model = 
    div []
        [ span [] [text model.name],          
          input  [toString model.quantity |> value] [], 
          button [onClick address Increment] [text "+"],
          button [onClick address Decrement] [text "-"]
        ]
            
          