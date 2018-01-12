module Styles exposing (Styles(..), Variations(..), styleSheet)

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
import AnimationName


type Styles
    = None
    | Symbol
    | OpeningLogo
    | Title
    | SelectionCursor
    | GameFrame
    | Pieces
    | Controller


type Variations
    = MiniExpansion
    | FadeOut
    | FadeIn


styleSheet : StyleSheet Styles Variations
styleSheet =
    Style.styleSheet
        [ style None
            [ variation FadeOut
                [ animations
                    [ { defaultAnimation
                        | name = AnimationName.fadeOut
                        , duration = 1000
                        , easing = Easing.toString Easing.EaseOut
                        , fill = Animation.Forwards
                      }
                    ]
                ]
            , variation FadeIn
                [ animations
                    [ { defaultAnimation
                        | name = AnimationName.fadeIn
                        , duration = 1000
                        , easing = Easing.toString Easing.EaseIn
                      }
                    ]
                ]
            ]
        , style Symbol
            [ strokeFill Colors.ink
            ]
        , style OpeningLogo
            [ transitions
                [ { delay = 0
                  , duration = 1000
                  , easing = Easing.toString Easing.EaseOut
                  , props = [ "box-shadow" ]
                  }
                ]
            , hover
                [ Shadow.box { offset = ( 0, 0 ), size = 20, blur = 20, color = Colors.moon } ]
            , variation MiniExpansion
                [ animations
                    [ { defaultAnimation
                        | name = AnimationName.miniExpand
                        , duration = 3000
                        , iteration = Animation.Infinite
                        , direction = Animation.Alternate
                        , easing = Easing.toString Easing.EaseInOut
                      }
                    ]
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
        , style GameFrame
            [ animations
                [ { defaultAnimation
                    | name = AnimationName.fadeIn
                    , duration = 1000
                    , easing = Easing.toString Easing.EaseIn
                  }
                ]

            -- , Border.all 2
            -- , Border.dotted
            ]
        , style Pieces
            [ Transition.all ]
        , style Controller
            [ strokeFill Colors.danger
            , strokeWidth 7
            , Transition.all
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
