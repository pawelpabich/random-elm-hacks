module ShoppingCart where

import Html exposing (..)
import Html.Attributes exposing (style, value)
import Html.Events exposing (on, onClick, targetValue)
import String
import Debug

type alias Item = 
    { 
        quantity : Int,
        name : String
    }

type alias Model = List Item
    
type ACTION = Increment String | Decrement String | Type String String


update : ACTION -> Model -> Model
update action model = 
    case action of 
        Increment name -> List.map (\i -> if i.name == name then { i | quantity = i.quantity + 1 } else i) model
        Decrement name -> List.map (\i -> if i.name == name then { i | quantity = i.quantity - 1 } else i) model
        Type name text -> List.map (\i -> if i.name == name then { i | quantity = Debug.watch "parsedvalue" text |> String.toInt |> Result.toMaybe |> Maybe.withDefault i.quantity } else i) model

view : Signal.Address ACTION -> Model -> Html  
view address model = 
    div [] (List.map (\i -> div [] [span [] [text i.name],          
                                 input  [toString i.quantity |> value, on "input" targetValue (Signal.message address << (Type i.name))] [], 
                                 button [onClick address (Increment i.name)] [text "+"],
                                 button [onClick address (Decrement i.name)] [text "-"]]) model)
            
          