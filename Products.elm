module Products where

import Html exposing (..)
import Html.Attributes exposing (style, value)
import Html.Events exposing (on, onClick, targetValue)
import String
import Debug
import Product
import List

type alias Model = List Product.Model
    
type Action = Buy String

update : Action -> Model -> Model
update action model = 
    case action of 
        Buy name -> Debug.watch "newproducts " (List.filter (\p -> p.name /= name) model)

view : Signal.Address Action -> Model -> Html                    
view address model = 
    div [] (List.map (\p -> div [] [Product.view p, button [onClick address (Buy p.name)] [text "Buy"]]) model)
            
          