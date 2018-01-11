module View exposing (view)

import Html exposing (Html)
import Element exposing (..)
import Element.Input as Input
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Types exposing (..)
import Styles exposing (..)
import Svg.Symbol as Symbol
import Controller.Keyboard
import Rocket exposing ((=>))
import View.Opening
import View.Playing


view : Model -> Html Msg
view model =
    Element.viewport styleSheet <|
        column None
            ([ width <| fill
             , height <| fill
             , center
             , verticalCenter
             ]
                ++ Controller.Keyboard.attributes model
            )
            [ html <| Symbol.symbols
            , case model.scene of
                Playing ->
                    View.Playing.view model

                Opening animation ->
                    View.Opening.view animation model
            ]
