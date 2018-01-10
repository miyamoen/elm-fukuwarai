module Update exposing (update, init)

import Task
import Window
import Types exposing (..)
import Rocket exposing ((=>))


init : ( Model, List (Cmd Msg) )
init =
    { windowSize = { width = 500, height = 500 }
    , scene = Opening Static
    }
        => [ Task.perform ResizeWindow Window.size ]


update : Msg -> Model -> ( Model, List (Cmd Msg) )
update msg model =
    case msg of
        NoOp ->
            model => []

        ResizeWindow size ->
            { model | windowSize = size } => []

        StartOpeningAnimation ->
            { model | scene = Opening Running } => []

        EndOpeningAnimation ->
            { model | scene = Playing } => []
