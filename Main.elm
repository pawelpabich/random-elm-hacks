import Application exposing (view, update, init)
import StartApp.Simple exposing (start)

main =
  start
    { model =  init [{name = "Phone"}, {name = "Ski"}] [],
      update = update,
      view = view
    }

          