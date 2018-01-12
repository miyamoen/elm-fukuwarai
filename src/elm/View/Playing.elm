module View.Playing exposing (..)

import Element exposing (..)
import Element.Input as Input
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Types exposing (..)
import Types.Pieces as Pieces
import Styles exposing (..)
import View.Pieces
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
        |> within (List.map pieceElement <| Pieces.toList model.pieces)


pieceElement : Piece -> Element Styles variation Msg
pieceElement { id, position, degree } =
    let
        center =
            Pieces.getCenter id
    in
        el Styles.Pieces
            [ moveRight <| position.x - center.x
            , moveDown <| position.y - center.y
            , inlineStyle
                [ "transform-origin" => toString center.x ++ "px " ++ toString center.y ++ "px"
                , "transform" => "rotate(" ++ toString degree ++ "deg)"
                ]
            ]
        <|
            View.Pieces.toElement id
