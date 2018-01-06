module View exposing (view)

import Html exposing (Html)
import Element exposing (..)
import Element.Input as Input
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Types exposing (..)
import View.Styles as Styles exposing (..)
import Svg.Symbol as Symbol
import Rocket exposing ((=>))


view : Model -> Html Msg
view model =
    Element.viewport styleSheet <|
        row None
            [ width <| fill
            , height <| fill
            , center
            , verticalCenter
            ]
            [ html <| Symbol.symbols
            , text "Hello, Style Elements"
            , el Styles.Symbol [ width <| px 100, height <| px 100 ] <| Symbol.angleElement 100 100
            ]
