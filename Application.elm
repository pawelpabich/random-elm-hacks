module Application where

import Html exposing (..)
import Html.Attributes exposing (style, value)
import Html.Events exposing (on, onClick, targetValue)
import Home
import Error
import Payment

type Page = HomePage | PaymentPage | ConfirmationPage

type alias Model =
    { 
        currentPage : Page,
        homePage : Home.Model,
        paymentPage: Payment.Model
    }  

type Action = Home Home.Action

update : Action -> Model -> Model           
update action model = 
    case action of
        Home act -> { 
                        model |
                            currentPage = HomePage,
                            homePage = Home.update act model.homePage
                    }
                    
view : Signal.Address Action -> Model -> Html                       
view address model = 
    case model.currentPage of 
        HomePage -> Home.view (Signal.forwardTo address Home) model.homePage
        PaymentPage -> Payment.view model.paymentPage
        _        -> Error.view "Not Found"             

init: a -> Model
init =
    always { currentPage = HomePage, homePage = Home.init(), paymentPage = Payment.init() }          