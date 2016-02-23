import Application
import StartApp.Simple exposing (start)

main =
  start
    { model = Application.init,
      update = Application.update,
      view = Application.view
    }