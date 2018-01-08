module Types exposing (..)

---- MODEL ----


type alias Model =
    { windowSize : Size }


type Scene
    = Opening


type alias Size =
    { width : Int
    , height : Int
    }



---- Animation ----


type Animation
    = Start
    | End



---- UPDATE ----


type Msg
    = NoOp
    | ResizeWindow Size
