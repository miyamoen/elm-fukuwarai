module Svg.Symbol.ElmLogo
    exposing
        ( size
        , symbol
        , oneSymbol
        , twoSymbol
        , threeSymbol
        , fourSymbol
        , fiveSymbol
        , sixSymbol
        , sevenSymbol
        , element
        )

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
        , id <| ElmLogo All
        ]
        [ one, two, three, four, five, six, seven ]


{-| blue top triangle
-}
oneSymbol : Svg msg
oneSymbol =
    TypedSvg.symbol [ viewBox 0 0 size.width size.height, id <| ElmLogo One ] [ one ]


{-| blue top triangle
-}
one : Svg msg
one =
    polygon
        [ fill <| Fill <| .blue Colors.elmLogo
        , points [ 323.298 => 143.724, 323.298 => 0, 179.573 => 0 ]
        ]
        []


{-| green trapezoid
-}
twoSymbol : Svg msg
twoSymbol =
    TypedSvg.symbol [ viewBox 0 0 size.width size.height, id <| ElmLogo Two ] [ two ]


{-| green trapezoid
-}
two : Svg msg
two =
    polygon
        [ fill <| Fill <| .green Colors.elmLogo
        , points [ 8.867 => 0, 79.241 => 70.375, 232.213 => 70.375, 161.838 => 0 ]
        ]
        []


{-| center yelllow triangle
-}
threeSymbol : Svg msg
threeSymbol =
    TypedSvg.symbol [ viewBox 0 0 size.width size.height, id <| ElmLogo Three ] [ three ]


{-| center yelllow triangle
-}
three : Svg msg
three =
    polygon
        [ fill <| Fill <| .yellow Colors.elmLogo
        , points [ 161.649 => 152.782, 231.514 => 82.916, 91.783 => 82.916 ]
        ]
        []


{-| green rect
-}
fourSymbol : Svg msg
fourSymbol =
    TypedSvg.symbol [ viewBox 0 0 size.width size.height, id <| ElmLogo Four ] [ four ]


{-| green rect
-}
four : Svg msg
four =
    rect
        [ fill <| Fill <| .green Colors.elmLogo
        , x 192.99
        , y 107.392
        , width 107.676
        , height 108.167
        , transform [ Matrix 0.7071 0.7071 -0.7071 0.7071 186.4727 -127.2386 ]
        ]
        []


{-| right yelllow triangle
-}
fiveSymbol : Svg msg
fiveSymbol =
    TypedSvg.symbol [ viewBox 0 0 size.width size.height, id <| ElmLogo Five ] [ five ]


{-| right yelllow triangle
-}
five : Svg msg
five =
    polygon
        [ fill <| Fill <| .yellow Colors.elmLogo
        , points [ 255.522 => 246.655, 323.298 => 314.432, 323.298 => 178.879 ]
        ]
        []


{-| grey triangle
-}
sixSymbol : Svg msg
sixSymbol =
    TypedSvg.symbol [ viewBox 0 0 size.width size.height, id <| ElmLogo Six ] [ six ]


{-| grey triangle
-}
six : Svg msg
six =
    polygon
        [ fill <| Fill <| .grey Colors.elmLogo
        , points [ 152.781 => 161.649, 0 => 8.868, 0 => 314.432 ]
        ]
        []


{-| blue bottom triangle
-}
sevenSymbol : Svg msg
sevenSymbol =
    TypedSvg.symbol [ viewBox 0 0 size.width size.height, id <| ElmLogo Seven ] [ seven ]


{-| blue bottom triangle
-}
seven : Svg msg
seven =
    polygon
        [ fill <| Fill <| .blue Colors.elmLogo
        , points [ 161.649 => 170.517, 8.869 => 323.298, 314.43 => 323.298 ]
        ]
        []



---- Html / Style Elements


html : Float -> Float -> Html msg
html w h =
    svg [ viewBox 0 0 size.width size.height, width w, height h ]
        [ use [ xlinkHref <| toSelector <| ElmLogo All ] [] ]


element : Float -> Float -> Element style variation msg
element w h =
    html w h
        |> Element.html
