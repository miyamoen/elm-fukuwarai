module Svg.Symbol.RotatingArrows
    exposing
        ( size
        , symbol
        , oneSymbol
        , twoSymbol
        , element
        )

import Html exposing (Html)
import Element exposing (Element)
import Svg exposing (Svg)
import TypedSvg exposing (path, svg, use)
import TypedSvg.Types exposing (Fill(..))
import TypedSvg.Attributes exposing (viewBox, xlinkHref, fill, d)
import TypedSvg.Attributes.InPx exposing (width, height)
import Svg.Path exposing (..)
import Colors
import Rocket exposing ((=>))
import Svg.Symbol.Types exposing (..)


---- Definitions ----


size : { width : Float, height : Float }
size =
    { width = 128, height = 128 }


symbol : Svg msg
symbol =
    TypedSvg.symbol
        [ viewBox 0 0 512 512
        , id <| RotatingArrows All
        ]
        [ one, two ]


{-| blue top triangle
-}
oneSymbol : Svg msg
oneSymbol =
    TypedSvg.symbol [ viewBox 0 0 size.width size.height, id <| RotatingArrows One ] [ one ]


{-| blue top triangle
-}
one : Svg msg
one =
    path
        [ fill <| Fill Colors.ink
        , d <| pathToString onePath
        ]
        []


onePath : Path
onePath =
    [ subpath (startAt ( 444.664, 67.716 ))
        closed
        [ lineByMany
            [ 17.721 => -24.2
            , -89.424 => -3.958
            , 34.427 => 79.069
            , 17.465 => -23.85
            ]
        , cubicBy ( 1.826, 1.634 ) ( 3.817, 3.105 ) ( 5.544, 4.844 )
        , cubicBy ( 30.003, 29.991 ) ( 48.483, 71.27 ) ( 48.495, 117.021 )
        , horizontalTo 512
        , cubicTo ( 512, 157.314 ) ( 485.927, 104.115 ) ( 444.664, 67.716 )
        ]
    ]


{-| green trapezoid
-}
twoSymbol : Svg msg
twoSymbol =
    TypedSvg.symbol [ viewBox 0 0 size.width size.height, id <| RotatingArrows Two ] [ two ]


{-| green trapezoid
-}
two : Svg msg
two =
    path
        [ fill <| Fill Colors.ink
        , d <| pathToString twoPath
        ]
        []


twoPath : Path
twoPath =
    [ subpath (startAt ( 87.147, 417.236 ))
        closed
        [ cubicBy ( -1.828, -1.634 ) ( -3.818, -3.106 ) ( -5.545, -4.845 )
        , cubicTo ( 51.599, 382.389 ) ( 33.119, 341.11 ) ( 33.108, 295.36 )
        , horizontalTo 0
        , cubicBy ( 0, 59.338 ) ( 26.08, 112.537 ) ( 67.336, 148.936 )
        , lineByMany
            [ -17.721 => 24.202
            , 89.424 => 3.945
            , -34.427 => -79.056
            ]
        , lineTo ( 87.147, 417.236 )
        ]
    ]



---- Html / Style Elements


html : Float -> Float -> Html msg
html w h =
    svg [ viewBox 0 0 size.width size.height, width w, height h ]
        [ use [ xlinkHref <| toSelector <| RotatingArrows All ] [] ]


element : Float -> Float -> Element style variation msg
element w h =
    html w h
        |> Element.html
