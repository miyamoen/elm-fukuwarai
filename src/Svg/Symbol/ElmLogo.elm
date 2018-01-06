module Svg.Symbol.ElmLogo exposing (symbol, element, html, size)

import Html exposing (Html)
import Element exposing (Element)
import Svg exposing (Svg)
import TypedSvg exposing (..)
import TypedSvg.Types exposing (..)
import TypedSvg.Attributes exposing (viewBox, xlinkHref, fill, points, transform)
import TypedSvg.Attributes.InPx exposing (x, y, width, height)
import Colors
import Rocket exposing ((=>))
import Svg.Symbol.Types exposing (..)


---- Definitions ----


size : { width : Float, height : Float }
size =
    { width = 323.141, height = 322.95 }


symbol : Svg msg
symbol =
    TypedSvg.symbol
        [ viewBox 0 0 size.width size.height
        , id ElmLogo
        ]
        [ polygon
            [ fill <| Fill <| .yellow Colors.elmLogo
            , points [ 161.649 => 152.782, 231.514 => 82.916, 91.783 => 82.916 ]
            ]
            []
        , polygon
            [ fill <| Fill <| .green Colors.elmLogo
            , points [ 8.867 => 0, 79.241 => 70.375, 232.213 => 70.375, 161.838 => 0 ]
            ]
            []
        , rect
            [ fill <| Fill <| .green Colors.elmLogo
            , x 192.99
            , y 107.392
            , width 107.676
            , height 108.167
            , transform [ Matrix 0.7071 0.7071 -0.7071 0.7071 186.4727 -127.2386 ]
            ]
            []
        , polygon
            [ fill <| Fill <| .blue Colors.elmLogo
            , points [ 323.298 => 143.724, 323.298 => 0, 179.573 => 0 ]
            ]
            []
        , polygon
            [ fill <| Fill <| .grey Colors.elmLogo
            , points [ 152.781 => 161.649, 0 => 8.868, 0 => 314.432 ]
            ]
            []
        , polygon
            [ fill <| Fill <| .yellow Colors.elmLogo
            , points [ 255.522 => 246.655, 323.298 => 314.432, 323.298 => 178.879 ]
            ]
            []
        , polygon
            [ fill <| Fill <| .blue Colors.elmLogo
            , points [ 161.649 => 170.517, 8.869 => 323.298, 314.43 => 323.298 ]
            ]
            []
        ]



---- Html / Style Elements


html : Float -> Float -> Html msg
html w h =
    svg [ viewBox 0 0 size.width size.height, width w, height h ]
        [ use [ xlinkHref <| toSelector ElmLogo ] [] ]


element : Float -> Float -> Element style variation msg
element w h =
    html w h
        |> Element.html
