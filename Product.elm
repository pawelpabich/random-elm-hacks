module Product where

import Html exposing (..)
import Html.Attributes exposing (style, value)
import Html.Events exposing (on, onClick, targetValue)
import String
import Debug

type alias Model = 
    { 
        name : String
    }    

type ACTION = None

view : Signal.Address ACTION -> Model -> Html
view address model = 
    div [] [span [] [text model.name]]
            
          