module Types exposing (..)

---- MODEL ----


type alias Model =
    { windowSize : Size
    , scene : Scene
    }


type Scene
    = Opening Animation
    | Playing


type alias Size =
    { width : Int
    , height : Int
    }



---- Animation ----


type Animation
    = Static
    | Running
    | End



---- UPDATE ----


type Msg
    = NoOp
    | ResizeWindow Size
    | StartOpeningAnimation
    | EndOpeningAnimation
