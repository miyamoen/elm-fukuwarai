module Svg.Symbol.Types exposing (Symbol(..), Parts(..), toSelector, id)

import Svg exposing (Attribute)
import Svg.Attributes


---- Types ----


type Symbol
    = Angle
    | ElmLogo Parts


type Parts
    = All
    | One
    | Two
    | Three
    | Four
    | Five
    | Six
    | Seven



---- Helper ----


toSelector : Symbol -> String
toSelector symbol =
    "#" ++ toId symbol


toId : Symbol -> String
toId symbol =
    case symbol of
        Angle ->
            "miyamoen-game-angle"

        ElmLogo All ->
            "miyamoen-elm-logo"

        ElmLogo One ->
            "miyamoen-elm-logo-one"

        ElmLogo Two ->
            "miyamoen-elm-logo-two"

        ElmLogo Three ->
            "miyamoen-elm-logo-three"

        ElmLogo Four ->
            "miyamoen-elm-logo-four"

        ElmLogo Five ->
            "miyamoen-elm-logo-five"

        ElmLogo Six ->
            "miyamoen-elm-logo-six"

        ElmLogo Seven ->
            "miyamoen-elm-logo-seven"


id : Symbol -> Attribute msg
id symbol =
    Svg.Attributes.id <| toId symbol
