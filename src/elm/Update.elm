module Update exposing (update, init)

import Task
import Window
import Types exposing (..)
import Types.Pieces as Pieces
import Svg.Symbol.Types as Symbol
import Random
import Rocket exposing ((=>))


init : ( Model, List (Cmd Msg) )
init =
    { windowSize = { width = 500, height = 500 }
    , scene = Opening Static
    , pieces = Pieces.model
    , target = Symbol.One
    }
        => [ Task.perform ResizeWindow Window.size ]


update : Msg -> Model -> ( Model, List (Cmd Msg) )
update msg model =
    case msg of
        NoOp ->
            model => []

        ResizeWindow size ->
            { model | windowSize = size }
                => [ Pieces.piecesGenerator size |> Random.generate SetPieces
                   ]

        SetPieces pieces ->
            { model | pieces = pieces } => []

        StartOpeningAnimation ->
            { model | scene = Opening Running } => []

        EndOpeningAnimation ->
            { model | scene = Playing } => []

        FocusOn target ->
            { model | target = target } => []

        PointPosition { offsetPos, clientPos } ->
            let
                position =
                    { x = Tuple.first clientPos - 20, y = Tuple.second clientPos - 20 }
            in
                { model
                    | pieces =
                        Pieces.update model.target
                            (\piece ->
                                { piece | position = position }
                            )
                            model.pieces
                }
                    => []

        RotatePiece degree ->
            { model
                | pieces =
                    Pieces.update model.target
                        (\piece ->
                            { piece | degree = piece.degree - degree }
                        )
                        model.pieces
            }
                => []
