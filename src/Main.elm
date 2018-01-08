module Main exposing (..)

import Html
import Types exposing (Model, Msg)
import Update exposing (init, update)
import Subscriptions exposing (subscriptions)
import View exposing (view)
import Rocket exposing ((=>), batchUpdate, batchInit)


---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init |> batchInit
        , update = update >> batchUpdate
        , subscriptions = subscriptions
        }
