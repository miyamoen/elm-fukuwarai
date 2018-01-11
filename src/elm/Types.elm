module Types exposing (..)

import Svg.Symbol.Types exposing (Pieces(..))


---- MODEL ----


type alias Model =
    { windowSize : Size
    , scene : Scene
    , pieces : List Piece
    }


type Scene
    = Opening Animation
    | Playing


type alias Piece =
    { position : Position
    , degree : Float
    , id : Pieces
    }


type alias Size =
    { width : Int
    , height : Int
    }


type alias Position =
    { x : Float
    , y : Float
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
