import Application
import StartApp.Simple exposing (start)

main =
  start
    { model =  { products = [{name = "Phone"}, {name = "Ski"}], shoppingCart = [] },
      update = Application.update,
      view = Application.view
    }

          