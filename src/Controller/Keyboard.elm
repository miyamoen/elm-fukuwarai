module Controller.Keyboard exposing (attributes, id, onKeyDown, toMsg, focusDom)

import Task
import Dom
import Element exposing (Attribute)
import Element.Attributes exposing (attribute)
import Element.Events exposing (on, onWithOptions)
import Keyboard.Event exposing (considerKeyboardEvent, KeyboardEvent)
import Keyboard.Key as Key
import Types exposing (..)


toMsg : KeyboardEvent -> Maybe Msg
toMsg { altKey, ctrlKey, shiftKey, metaKey, key, keyCode, repeat } =
    case ( keyCode, ctrlKey, shiftKey ) of
        ( Key.One, False, False ) ->
            Just NoOp

        _ ->
            Nothing


onKeyDown : Attribute variation Msg
onKeyDown =
    onWithOptions "keydown" (Options True True) <|
        considerKeyboardEvent toMsg


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


attributes : List (Attribute variation Msg)
attributes =
    [ id
    , attribute "tabindex" "0"
    , onKeyDown
    ]
