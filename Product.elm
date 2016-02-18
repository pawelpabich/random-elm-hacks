module Product where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

type alias Location =      -- type aliases for records
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
        [ p [] [text model.name],
          button [onClick address Decrement] [text "-"],
          div [] [text (toString model.quantity)], 
          button [onClick address Increment] [text "+"]
        ]
            
          