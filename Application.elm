module Application where

import Html exposing (..)
import Html.Attributes exposing (style, value)
import Html.Events exposing (on, onClick, targetValue)
import String
import Debug
import Products
import ShoppingCart

type alias Model =
    { 
        products : Products.Model,
        shoppingCart: ShoppingCart.Model
    }   

type ACTION = ShoppingCart ShoppingCart.ACTION | Products Products.ACTION

init products shoppingCart = 
    {
        products = products,
        shoppingCart = shoppingCart
    }
           
update action model = 
    case action of 
        ShoppingCart act -> { 
                        model |
                            shoppingCart = ShoppingCart.update act model.shoppingCart
                    }
        Products act -> model

view : Signal.Address ACTION -> Model -> Html                       
view address model = 
    div [] [Products.view (Signal.forwardTo address Products) model.products, ShoppingCart.view (Signal.forwardTo address ShoppingCart) model.shoppingCart]             
          