module View exposing (view)

import Html exposing (Html)
import Element exposing (..)
import Element.Input as Input
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Types exposing (..)
import View.Styles as Styles exposing (..)
import Svg.Symbol as Symbol
import Svg.Symbol.ElmLogo as ElmLogo
import Controller.Keyboard
import Rocket exposing ((=>))


view : Model -> Html Msg
view model =
    Element.viewport styleSheet <|
        column None
            ([ width <| fill
             , height <| fill
             , spacing 10
             , center
             , verticalCenter
             ]
                ++ Controller.Keyboard.attributes
            )
            [ html <| Symbol.symbols
            , text "Hello, Style Elements"
            , el None [ width <| px <| .width ElmLogo.size, height <| px <| .height ElmLogo.size ] <|
                ElmLogo.element (.width ElmLogo.size) (.height ElmLogo.size)
            , el Styles.Symbol [ width <| px 100, height <| px 100 ] <| Symbol.angleElement 100 100
            ]
