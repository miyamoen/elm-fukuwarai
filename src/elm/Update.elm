module Update exposing (update, init)

import Task
import Window
import Types exposing (..)
import Types.Pieces as Pieces
import Types.Positions as Positions
import Svg.Symbol.Types as Symbol
import Random
import Rocket exposing ((=>))


init : ( Model, List (Cmd Msg) )
init =
    { windowSize = { width = 500, height = 500 }
    , scene = Opening Static
    , pieces = Pieces.model
    , target = Just Symbol.One
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
            case model.target of
                Nothing ->
                    model => []

                Just targetPiece ->
                    { model
                        | pieces =
                            Pieces.positionUpdate targetPiece
                                (\_ -> { x = Tuple.first clientPos - 20, y = Tuple.second clientPos - 20 })
                                model.pieces
                    }
                        => []

        MoveTarget delta ->
            case model.target of
                Nothing ->
                    model => []

                Just targetPiece ->
                    { model
                        | pieces =
                            Pieces.positionUpdate targetPiece
                                (\position ->
                                    Positions.add delta position
                                        |> Positions.clamp ( 0, 0 )
                                            ( toFloat (model.windowSize.width - 40), toFloat (model.windowSize.height - 40) )
                                )
                                model.pieces
                    }
                        => []

        RotatePiece delta ->
            case model.target of
                Nothing ->
                    model => []

                Just targetPiece ->
                    { model
                        | pieces =
                            Pieces.degreeUpdate targetPiece
                                (\degree -> degree - delta)
                                model.pieces
                    }
                        => []
