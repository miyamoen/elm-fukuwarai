module View exposing (view)

import Html exposing (Html)
import Element exposing (..)
import Element.Input as Input
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Types exposing (..)
import View.Styles as Styles exposing (..)
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
            [ text "Hello, Style Elements" ]
