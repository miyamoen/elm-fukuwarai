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
    case ( keyCode, ctrlKey, shiftKey ) of
        ( Key.Enter, False, False ) ->
            Just StartOpeningAnimation

        ( Key.R, False, False ) ->
            Just (RotatePiece 5)

        ( Key.R, True, False ) ->
            Just (RotatePiece 15)

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
