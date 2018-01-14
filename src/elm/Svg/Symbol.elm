module Svg.Symbol exposing (symbols, angleElement, angleHtml)

import Html exposing (Html)
import Element exposing (Element)
import Svg exposing (Svg)
import TypedSvg exposing (..)
import TypedSvg.Types exposing (..)
import TypedSvg.Attributes exposing (viewBox, points, xlinkHref, noFill, fill, points, transform)
import TypedSvg.Attributes.InPx exposing (x, y, width, height, strokeWidth)
import Color exposing (rgba)
import Colors
import Rocket exposing ((=>))
import Svg.Symbol.Types exposing (..)
import Svg.Symbol.ElmLogo as ElmLogo
import Svg.Symbol.Controller as Controller
import Svg.Symbol.RotatingArrows as RotatingArrows



---- Definitions ----


symbols : Html msg
symbols =
    svg [ width 0, height 0 ]
        [ defs []
            [ angle
            , ElmLogo.symbol
            , Controller.symbol
            , ElmLogo.oneSymbol
            , ElmLogo.twoSymbol
            , ElmLogo.threeSymbol
            , ElmLogo.fourSymbol
            , ElmLogo.fiveSymbol
            , ElmLogo.sixSymbol
            , ElmLogo.sevenSymbol
            , RotatingArrows.symbol
            , RotatingArrows.oneSymbol
            , RotatingArrows.twoSymbol
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



---- Html / Style Elements


angleHtml : Float -> Float -> Html msg
angleHtml w h =
    svg [ viewBox 0 0 100 100, width w, height h ]
        [ use [ xlinkHref <| toSelector Angle ] [] ]


angleElement : Float -> Float -> Element style variation msg
angleElement w h =
    angleHtml w h
        |> Element.html
