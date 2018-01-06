module Svg.Symbol.Types exposing (Symbol(..), toSelector, id)

import Svg exposing (Attribute)
import Svg.Attributes


---- Types ----


type Symbol
    = Angle
    | ElmLogo



---- Helper ----


toSelector : Symbol -> String
toSelector symbol =
    "#" ++ toId symbol


toId : Symbol -> String
toId symbol =
    case symbol of
        Angle ->
            "miyamoen-game-angle"

        ElmLogo ->
            "miyamoen-elm-logo"


id : Symbol -> Attribute msg
id symbol =
    Svg.Attributes.id <| toId symbol
