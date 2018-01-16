module Svg.Symbol.PointCursor
    exposing
        ( size
        , symbol
        , element
        , html
        )

import Html exposing (Html)
import Element exposing (Element)
import Svg exposing (Svg)
import TypedSvg exposing (path, svg, use)
import TypedSvg.Attributes exposing (viewBox, xlinkHref, d)
import TypedSvg.Attributes.InPx exposing (width, height)
import Svg.Path exposing (..)
import Colors
import Rocket exposing ((=>))
import Svg.Symbol.Types exposing (..)


---- Definitions ----


size : { width : Float, height : Float }
size =
    { width = 512, height = 512 }


symbol : Svg msg
symbol =
    TypedSvg.symbol
        [ viewBox 0 0 size.width size.height
        , id PointCursor
        ]
        [ path [ d <| pathToString centerPath ] []
        , path [ d """M511.13,254.868L410.124,228.04c-5.79-32.047-21.284-60.778-43.346-82.823
c-22.044-22.062-50.784-37.564-82.83-43.346L257.128,0.875c-0.136-0.508-0.598-0.87-1.133-0.87s-0.996,0.362-1.133,0.87
l-26.819,100.997c-32.056,5.781-60.796,21.284-82.831,43.346c-22.071,22.035-37.566,50.785-43.346,82.832L0.869,254.868
C0.363,255.003,0,255.465,0,256c0,0.535,0.363,0.997,0.869,1.133l100.998,26.819c5.78,32.047,21.274,60.787,43.346,82.832
c22.035,22.062,50.775,37.555,82.822,43.346l26.828,100.997c0.136,0.507,0.598,0.869,1.133,0.869s0.996-0.362,1.133-0.869
l26.828-100.997c32.038-5.79,60.777-21.284,82.821-43.346c22.062-22.044,37.556-50.785,43.346-82.822l101.006-26.828
c0.508-0.136,0.87-0.598,0.87-1.133C512,255.465,511.637,255.003,511.13,254.868z M337.621,337.626
c-20.956,20.921-49.687,33.796-81.626,33.814c-31.948-0.018-60.669-12.893-81.626-33.814
c-20.929-20.957-33.804-49.688-33.814-81.626c0.01-31.947,12.884-60.669,33.814-81.626c20.957-20.921,49.679-33.805,81.626-33.814
c31.938,0.008,60.67,12.893,81.626,33.814c20.921,20.957,33.796,49.679,33.814,81.626
C371.417,287.938,358.542,316.669,337.621,337.626z""" ] []
        ]


centerPath : Path
centerPath =
    [ subpath (startAt ( 255.995, 198.276 ))
        closed
        [ cubicBy ( -31.884, 0 ) ( -57.724, 25.84 ) ( -57.724, 57.724 )
        , cubicBy ( 0, 31.875 ) ( 25.841, 57.716 ) ( 57.724, 57.716 )
        , cubicBy ( 31.874, 0 ) ( 57.716, -25.841 ) ( 57.716, -57.716 )
        , cubicTo ( 313.711, 224.116 ) ( 287.87, 198.276 ) ( 255.995, 198.276 )
        ]
    ]



---- Html / Style Elements


html : Float -> Float -> Html msg
html w h =
    svg [ viewBox 0 0 size.width size.height, width w, height h ]
        [ use [ xlinkHref <| toSelector PointCursor ] [] ]


element : Float -> Float -> Element style variation msg
element w h =
    html w h
        |> Element.html
