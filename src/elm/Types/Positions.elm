module Types.Positions exposing (..)

import Types exposing (..)


add : ( Float, Float ) -> Position -> Position
add ( dx, dy ) pos =
    { x = pos.x + dx, y = pos.y + dy }


clamp : ( Float, Float ) -> ( Float, Float ) -> Position -> Position
clamp ( minX, minY ) ( maxX, maxY ) pos =
    { x = Basics.clamp minX maxX pos.x, y = Basics.clamp minY maxY pos.y }
