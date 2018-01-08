module Subscriptions exposing (subscriptions)

import Window
import Types exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Window.resizes ResizeWindow ]
