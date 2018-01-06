module Svg.Symbol exposing (toSelector, Symbol(..), symbols, angleElement, angleHtml)

import Html exposing (Html)
import Element exposing (Element)
import Svg exposing (Svg, Attribute)
import Svg.Attributes
import TypedSvg exposing (..)
import TypedSvg.Attributes exposing (viewBox, points, xlinkHref)
import TypedSvg.Attributes.InPx exposing (x, y, width, height, strokeWidth)
import Rocket exposing ((=>))


---- Types ----


type Symbol
    = Angle



---- Helper ----


toSelector : Symbol -> String
toSelector symbol =
    "#" ++ toId symbol


toId : Symbol -> String
toId symbol =
    case symbol of
        Angle ->
            "miyamoen-game-angle"


id : Symbol -> Attribute msg
id symbol =
    Svg.Attributes.id <| toId symbol



---- Definitions ----


symbols : Html msg
symbols =
    svg [ viewBox 0 0 100 100, width 0, height 0 ]
        [ defs []
            [ angle ]
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
