module Update exposing (update, init)

import Types exposing (..)
import Rocket exposing ((=>))


init : ( Model, List (Cmd Msg) )
init =
    {} => []


update : Msg -> Model -> ( Model, List (Cmd Msg) )
update msg model =
    case msg of
        NoOp ->
            model => []
