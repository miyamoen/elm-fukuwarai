module Controller.Keyboard exposing (attributes, id, onKeyDown, toMsg, focusDom)

import Task
import Dom
import Element exposing (Attribute)
import Element.Attributes exposing (attribute)
import Element.Events exposing (on, onWithOptions)
import Keyboard.Event exposing (considerKeyboardEvent, KeyboardEvent)
import Keyboard.Key as Key
import Types exposing (..)
import Svg.Symbol.Types exposing (Pieces(..))


toMsg : Model -> KeyboardEvent -> Maybe Msg
toMsg model event =
    case model.scene of
        Opening _ ->
            toMsgInOpening model event

        Playing ->
            toMsgInPlaying model event


toMsgInOpening : Model -> KeyboardEvent -> Maybe Msg
toMsgInOpening model { altKey, ctrlKey, shiftKey, keyCode } =
    case keyCode of
        Key.Enter ->
            Just StartOpeningAnimation

        _ ->
            Nothing


toMsgInPlaying : Model -> KeyboardEvent -> Maybe Msg
toMsgInPlaying model { altKey, ctrlKey, shiftKey, keyCode } =
    case ( keyCode, ctrlKey ) of
        ( Key.J, False ) ->
            Just (RotatePiece 5)

        ( Key.J, True ) ->
            Just (RotatePiece 15)

        ( Key.K, False ) ->
            Just (RotatePiece -5)

        ( Key.K, True ) ->
            Just (RotatePiece -15)

        ( Key.Down, False ) ->
            Just (MoveTarget ( 0, 1 ))

        ( Key.Down, True ) ->
            Just (MoveTarget ( 0, 25 ))

        ( Key.Up, False ) ->
            Just (MoveTarget ( 0, -1 ))

        ( Key.Up, True ) ->
            Just (MoveTarget ( 0, -25 ))

        ( Key.Right, False ) ->
            Just (MoveTarget ( 1, 0 ))

        ( Key.Right, True ) ->
            Just (MoveTarget ( 25, 0 ))

        ( Key.Left, False ) ->
            Just (MoveTarget ( -1, 0 ))

        ( Key.Left, True ) ->
            Just (MoveTarget ( -25, 0 ))

        ( Key.Enter, _ ) ->
            Just <|
                FocusOn <|
                    case model.target of
                        Just One ->
                            Just Two

                        Just Two ->
                            Just Three

                        Just Three ->
                            Just Four

                        Just Four ->
                            Just Five

                        Just Five ->
                            Just Six

                        Just Six ->
                            Just Seven

                        Just Seven ->
                            Nothing

                        Just All ->
                            Just One

                        Nothing ->
                            Just One

        _ ->
            Nothing


onKeyDown : Model -> Attribute variation Msg
onKeyDown model =
    onWithOptions "keydown" (Options True True) <|
        considerKeyboardEvent (toMsg model)


type alias Options =
    { stopPropagation : Bool
    , preventDefault : Bool
    }


focusDom : Cmd Msg
focusDom =
    Dom.focus idString |> Task.attempt (always NoOp)



---- Setup ----


idString : String
idString =
    "keyboard-dom"


id : Attribute variation msg
id =
    Element.Attributes.id idString


attributes : Model -> List (Attribute variation Msg)
attributes model =
    [ id
    , attribute "tabindex" "0"
    , onKeyDown model
    ]
