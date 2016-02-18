module Product where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

type alias Model = Int

type ACTION = Increment | Decrement

update action model = 
    case action of 
        Increment -> model + 1
        Decrement -> model + 1

view address model = 
    div []
        [ button [onClick address Decrement] [text "-"],
          div [] [text (toString model)], 
          button [onClick address Increment] [text "+"]
        ]
            
          