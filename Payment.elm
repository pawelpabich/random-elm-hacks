module Payment where

import Html exposing (..)
 
type alias Model = Int
 
view : Model -> Html
view model = 
    section [] [span [] [text (toString model)]]
    
init: Model
init = 0