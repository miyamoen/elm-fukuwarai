module Svg.Symbol.Controller exposing (symbol, html, element)

import Html exposing (Html)
import Element exposing (Element)
import Svg exposing (Svg)
import TypedSvg exposing (..)
import TypedSvg.Types exposing (..)
import TypedSvg.Attributes exposing (viewBox, xlinkHref, fill, points, transform, noFill)
import TypedSvg.Attributes.InPx exposing (cx, cy, r, x, y, width, height)
import Colors
import Rocket exposing ((=>))
import Svg.Symbol.Types exposing (..)


---- Definitions ----


symbol : Svg msg
symbol =
    TypedSvg.symbol
        [ viewBox 0 0 100 100
        , id Controller
        ]
        [ circle [ cx 50, cy 50, r 45, noFill ] [] ]



---- Html / Style Elements


html : Float -> Float -> Html msg
html w h =
    svg [ viewBox 0 0 100 100, width w, height h ]
        [ use [ xlinkHref <| toSelector Controller ] [] ]


element : Float -> Float -> Element style variation msg
element w h =
    html w h
        |> Element.html
