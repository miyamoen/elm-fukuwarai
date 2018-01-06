module View.Styles exposing (Styles(..), styleSheet)

import Style exposing (..)
import Style.Font as Font
import Style.Color as Color
import Style.Shadow as Shadow
import Style.Border as Border
import Style.Transition as Transition exposing (Transition)
import Color exposing (Color, rgba)
import Color.Convert exposing (colorToCssRgba)
import Colors


type Styles
    = None
    | Symbol


styleSheet : StyleSheet Styles variation
styleSheet =
    Style.styleSheet
        [ style None []
        , style Symbol
            [ strokeFill Colors.ink
            , fill <| rgba 0 0 0 0
            ]
        ]


zIndex : Int -> Property class variation
zIndex n =
    prop "z-index" (toString n)


fill : Color -> Property class variation
fill color =
    prop "fill" <| colorToCssRgba color


strokeFill : Color -> Property class variation
strokeFill color =
    prop "stroke" <| colorToCssRgba color


strokeWidth : number -> Property class variation
strokeWidth w =
    prop "stroke-width" <| toString w
