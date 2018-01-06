module Svg.Symbol
    exposing
        ( toSelector
        , Symbol(..)
        , symbols
        , angleElement
        , angleHtml
        , elmLogoElement
        , elmLogoHtml
        , elmLogoSize
        )

import Html exposing (Html)
import Element exposing (Element)
import Svg exposing (Svg, Attribute)
import Svg.Attributes
import TypedSvg exposing (..)
import TypedSvg.Types exposing (..)
import TypedSvg.Attributes exposing (viewBox, points, xlinkHref, noFill, fill, points, transform)
import TypedSvg.Attributes.InPx exposing (x, y, width, height, strokeWidth)
import Color exposing (rgba)
import Colors
import Rocket exposing ((=>))


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



---- Definitions ----


symbols : Html msg
symbols =
    svg [ width 0, height 0 ]
        [ defs []
            [ angle
            , elmLogo
            ]
        ]


angle : Svg msg
angle =
    symbol
        [ viewBox 0 0 100 100
        , id Angle
        ]
        [ polyline
            [ points
                [ 10 => 50
                , 50 => 10
                , 90 => 50
                ]
            , noFill
            ]
            []
        ]

elmLogoSize : {width : Float , height : Float }
elmLogoSize =
    { width = 323.141, height =322.95}
elmLogo : Svg msg
elmLogo =
    symbol
        [ viewBox 0 0 elmLogoSize.width elmLogoSize.height
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


angleHtml : Float -> Float -> Html msg
angleHtml w h =
    svg [ viewBox 0 0 100 100, width w, height h ]
        [ use [ xlinkHref <| toSelector Angle ] [] ]


angleElement : Float -> Float -> Element style variation msg
angleElement w h =
    angleHtml w h
        |> Element.html


elmLogoHtml : Float -> Float -> Html msg
elmLogoHtml w h =
    svg [ viewBox 0 0 elmLogoSize.width elmLogoSize.height, width w, height h ]
        [ use [ xlinkHref <| toSelector ElmLogo ] [] ]


elmLogoElement : Float -> Float -> Element style variation msg
elmLogoElement w h =
    elmLogoHtml w h
        |> Element.html
