module View exposing (view)

import Html exposing (Html)
import Element exposing (..)
import Element.Input as Input
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Types exposing (..)
import Styles exposing (..)
import Svg.Symbol as Symbol
import Svg.Symbol.ElmLogo as ElmLogo
import Controller.Keyboard
import Rocket exposing ((=>))
import View.Opening


view : Model -> Html Msg
view model =
    Element.viewport styleSheet <|
        column None
            ([ width <| fill
             , height <| fill
             , center
             , verticalCenter
             ]
                ++ Controller.Keyboard.attributes
            )
            [ html <| Symbol.symbols
            , case model.scene of
                Loading ->
                    text "loading"

                Opening animation ->
                    View.Opening.view animation model
            ]
