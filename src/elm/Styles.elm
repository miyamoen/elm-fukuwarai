module Styles exposing (Styles(..), styleSheet)

import Style exposing (..)
import Style.Font as Font exposing (font)
import Style.Color as Color
import Style.Shadow as Shadow
import Style.Border as Border
import Style.Transition as Transition exposing (Transition, transitions)
import Style.Animation as Animation exposing (Animation, animations, defaultAnimation)
import Style.Easing as Easing exposing (Easing)
import Color exposing (Color, rgba)
import Color.Convert exposing (colorToCssRgba)
import Colors


type Styles
    = None
    | Symbol
    | OpeningLogo
    | Title
    | SelectionCursor


styleSheet : StyleSheet Styles variation
styleSheet =
    Style.styleSheet
        [ style None []
        , style Symbol
            [ strokeFill Colors.ink
            ]
        , style OpeningLogo
            [ animations
                [ { defaultAnimation
                    | name = "pulse"
                    , duration = 3000
                    , iteration = Animation.Infinite
                    , direction = Animation.Alternate
                  }
                ]
            ]
        , style Title
            [ Font.typeface
                [ Font.importUrl
                    { url = "https://fonts.googleapis.com/css?family=Kaushan+Script"
                    , name = "Kaushan Script"
                    }
                , Font.cursive
                ]
            , Font.size 60
            ]
        , style SelectionCursor
            [ rotate <| degrees 90
            , strokeFill Colors.info
            , strokeWidth 10
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
