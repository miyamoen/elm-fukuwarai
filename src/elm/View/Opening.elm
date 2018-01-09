module View.Opening exposing (view)

import Element exposing (..)
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Types exposing (..)
import Styles exposing (..)
import Svg.Symbol as Symbol
import Svg.Symbol.ElmLogo as ElmLogo
import Rocket exposing ((=>))


view : Animation -> Model -> Element Styles Variations Msg
view animation model =
    column None
        [ spacing 10
        , center
        , verticalCenter
            , vary FadeOut (animation == Running)

        ]
        [ el OpeningLogo
            [ width <| px <| .width ElmLogo.size
            , height <| px <| .height ElmLogo.size
            , vary MiniExpansion (animation == Static)
            ]
          <|
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

