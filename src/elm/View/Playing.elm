module View.Playing exposing (..)

import Json.Decode as Json
import Element exposing (..)
import Element.Input as Input
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Types exposing (..)
import Types.Pieces as Pieces
import Styles exposing (..)
import View.Pieces
import View.Helper exposing (..)
import Svg.Symbol.Controller as Controller
import Rocket exposing ((=>))


view : Model -> Element Styles Variations Msg
view model =
    el None
        [ width Attrs.fill
        , height Attrs.fill
        , padding 20
        , clip
        ]
    <|
        field model


field : Model -> Element Styles variation Msg
field model =
    el GameFrame
        [ width Attrs.fill
        , height Attrs.fill
        ]
        empty
        |> within
            ((List.map View.Pieces.toElement <| Pieces.toList model.pieces) ++ [ controller model ])


controller : Model -> Element Styles variation Msg
controller { pieces, target } =
    let
        { position } =
            Pieces.toGetter target pieces
    in
        el Controller
            [ width <| px 100
            , height <| px 100
            , inlineStyle
                [ "pointer-events" => "none"
                , transforms [ Translate (position.x - 50) (position.y - 50) ]
                ]
            ]
        <|
            Controller.element 100 100
