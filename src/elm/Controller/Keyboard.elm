module Controller.Keyboard exposing (attributes, id, onKeyDown, toMsg, focusDom)

import Task
import Dom
import Element exposing (Attribute)
import Element.Attributes exposing (attribute)
import Element.Events exposing (on, onWithOptions)
import Keyboard.Event exposing (considerKeyboardEvent, KeyboardEvent)
import Keyboard.Key as Key
import Types exposing (..)


toMsg : Model -> KeyboardEvent -> Maybe Msg
toMsg model { altKey, ctrlKey, shiftKey, metaKey, key, keyCode, repeat } =
    case ( model.scene, keyCode, ctrlKey, shiftKey ) of
        ( Opening Static, Key.Enter, False, False ) ->
            Just StartOpeningAnimation

        ( Playing, Key.J, False, False ) ->
            Just (RotatePiece 5)

        ( Playing, Key.J, True, False ) ->
            Just (RotatePiece 15)

        ( Playing, Key.K, False, False ) ->
            Just (RotatePiece -5)

        ( Playing, Key.K, True, False ) ->
            Just (RotatePiece -15)

        ( Playing, Key.Down, False, False ) ->
            Just (MoveTarget ( 0, 1 ))

        ( Playing, Key.Down, True, False ) ->
            Just (MoveTarget ( 0, 25 ))

        ( Playing, Key.Up, False, False ) ->
            Just (MoveTarget ( 0, -1 ))

        ( Playing, Key.Up, True, False ) ->
            Just (MoveTarget ( 0, -25 ))

        ( Playing, Key.Right, False, False ) ->
            Just (MoveTarget ( 1, 0 ))

        ( Playing, Key.Right, True, False ) ->
            Just (MoveTarget ( 25, 0 ))

        ( Playing, Key.Left, False, False ) ->
            Just (MoveTarget ( -1, 0 ))

        ( Playing, Key.Left, True, False ) ->
            Just (MoveTarget ( -25, 0 ))

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
