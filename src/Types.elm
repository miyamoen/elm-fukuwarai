module Types exposing (..)

---- MODEL ----


type alias Model =
    { windowSize : Size }


type alias Size =
    { width : Int
    , height : Int
    }



---- UPDATE ----


type Msg
    = NoOp
    | ResizeWindow Size
