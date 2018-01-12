module Types exposing (..)

import Svg.Symbol.Types as Symbol


---- MODEL ----


type alias Model =
    { windowSize : Size
    , scene : Scene
    , pieces : Pieces
    }


type Scene
    = Opening Animation
    | Playing


type alias Piece =
    { position : Position
    , degree : Float
    , id : Symbol.Pieces
    }


type alias Pieces =
    { one : Piece
    , two : Piece
    , three : Piece
    , four : Piece
    , five : Piece
    , six : Piece
    , seven : Piece
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
    | SetPieces Pieces
    | StartOpeningAnimation
    | EndOpeningAnimation
