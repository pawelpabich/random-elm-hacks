module Product where

import Html exposing (..)
import String
import Debug

type alias Model =
    { 
        name : String
    }    

view : Model -> Html
view model = 
    div [] [span [] [text model.name]]
            
          