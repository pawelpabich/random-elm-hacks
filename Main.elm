import Product exposing (update, view)
import StartApp.Simple exposing (start)

main =
  start
    { model =  {name = "Phone", quantity = 0}
    , update = update
    , view = view
    }

          