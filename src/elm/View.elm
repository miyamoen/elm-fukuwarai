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
            , el OpeningLogo [ width <| px <| .width ElmLogo.size, height <| px <| .height ElmLogo.size ] <|
                ElmLogo.element (.width ElmLogo.size) (.height ElmLogo.size)
            , el Title [] <| text "Elm Fukuwarai "
            , column None
                []
                [ row None
                    [ verticalCenter, spacing 5 ]
                    [ el SelectionCursor [ width <| px 20, height <| px 20 ] <| Symbol.angleElement 20 20
                    , text "Enter to Start"
                    ]
                ]
            ]
