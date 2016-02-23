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
    
type Action = Increment String | Decrement String | Type String String | Add String | Pay


update : Action -> Model -> Model
update action model = 
    case action of 
        Increment name -> List.map (\i -> if i.name == name then { i | quantity = i.quantity + 1 } else i) model
        Decrement name -> List.map (\i -> if i.name == name then { i | quantity = i.quantity - 1 } else i) model
        Type name text -> List.map (\i -> if i.name == name then { i | quantity = Debug.watch "parsedvalue" text |> String.toInt |> Result.toMaybe |> Maybe.withDefault i.quantity } else i) model
        Add name -> if List.any (\i -> i.name == name) model then model else {name = name, quantity = 0} :: model
        Pay -> model

view : Signal.Address Action -> Model -> Html  
view address model = 
    section [] [h1 [] [text "Shopping Cart"], ul [] (List.map (\i -> li [] [span [] [text i.name],          
                                 input  [toString i.quantity |> value, on "input" targetValue (Signal.message address << (Type i.name))] [], 
                                 button [onClick address (Increment i.name)] [text "+"],
                                 button [onClick address (Decrement i.name)] [text "-"]]) model), button[onClick address Pay] [text "Pay"]]