module View.Playing exposing (..)

import Element exposing (..)
import Element.Input as Input
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Types exposing (..)
import Styles exposing (..)
import View.Pieces as Pieces
import Rocket exposing ((=>))


view : Model -> Element Styles Variations Msg
view model =
    el None
        [ width Attrs.fill
        , height Attrs.fill
        , padding 20
        ]
    <|
        el GameFrame
            [ width Attrs.fill
            , height Attrs.fill
            , padding 20
            , vary FadeIn True
            , onClick StartOpeningAnimation
            ]
        <|
            text "Palying"
