module Controller.Mouse exposing (..)

import Json.Decode as Decode exposing (Decoder, succeed, fail)
import Element exposing (Attribute)
import Element.Events exposing (on)
import Mouse exposing (Keys)


considerMouseEvent : (Mouse.Event -> Maybe msg) -> Decoder msg
considerMouseEvent func =
    Decode.andThen
        (\event ->
            case func event of
                Just msg ->
                    succeed msg

                Nothing ->
                    fail "Ignoring mouse event"
        )
        Mouse.eventDecoder


onNormalClick : (Mouse.Event -> msg) -> Attribute variation msg
onNormalClick toMsg =
    on "click" <|
        considerMouseEvent <|
            withKeys { alt = False, ctrl = False, shift = False } toMsg


onCtrlClick : (Mouse.Event -> msg) -> Attribute variation msg
onCtrlClick toMsg =
    on "click" <|
        considerMouseEvent <|
            withKeys { alt = False, ctrl = True, shift = False } toMsg


withKeys : Keys -> (Mouse.Event -> msg) -> Mouse.Event -> Maybe msg
withKeys conditions toMsg event =
    if conditions == event.key then
        Just <| toMsg event
    else
        Nothing
