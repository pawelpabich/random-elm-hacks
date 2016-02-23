module Error where

import Html exposing (..)
 
type alias Model = String
 
view : Model -> Html
view model = 
    section [] [span [] [text model]]
            
          