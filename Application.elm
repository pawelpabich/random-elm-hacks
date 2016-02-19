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

update : ACTION -> Model -> Model           
update action model = 
    case action of 
        ShoppingCart act -> { 
                        model |
                            shoppingCart = ShoppingCart.update act model.shoppingCart
                    }
        Products act ->
                        case act of 
                            Products.Buy name ->  { 
                                model |
                                    products = Products.update (Debug.watch "act1" act) model.products,
                                    shoppingCart = ShoppingCart.update (ShoppingCart.Add name) model.shoppingCart
                            }
                            _ ->
                            { 
                                model |
                                    products = Products.update (Debug.watch "act2" act) model.products
                            }

view : Signal.Address ACTION -> Model -> Html                       
view address model = 
    div [] [Products.view (Signal.forwardTo address Products) model.products, ShoppingCart.view (Signal.forwardTo address ShoppingCart) model.shoppingCart]             
          