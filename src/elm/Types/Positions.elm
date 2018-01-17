module Types.Positions exposing (..)

import Types exposing (..)


add : ( Float, Float ) -> Position -> Position
add ( dx, dy ) pos =
    { x = pos.x + dx, y = pos.y + dy }
