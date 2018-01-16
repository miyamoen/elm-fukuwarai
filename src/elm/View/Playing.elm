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
import Svg.Symbol.RotatingArrows as RotatingArrows
import Svg.Symbol.PointCursor as PointCursor
import Controller.Mouse exposing (onNormalClick)
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
        , id "gameframe"
        , onNormalClick PointPosition
        ]
        empty
        |> within
            ((List.map View.Pieces.toElement <| Pieces.toList model.pieces) ++ [ controller model ])


controller : Model -> Element Styles variation Msg
controller ({ pieces, target } as model) =
    let
        { position } =
            Pieces.toGetter target pieces
    in
        el Cursor
            [ width <| px 100
            , height <| px 100
            , inlineStyle
                [ "pointer-events" => "none"
                , transforms [ Translate (position.x - 50) (position.y - 50) ]
                ]
            ]
        <|
            pointCursor model


pointCursor : Model -> Element Styles variation Msg
pointCursor model =
    el None
        []
        (RotatingArrows.element 100 100)
        |> within [ row None [ width <| px 100, height <| px 100, center, verticalCenter ] [ PointCursor.element 50 50 ] ]
