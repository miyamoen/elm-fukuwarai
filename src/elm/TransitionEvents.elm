module TransitionEvents
    exposing
        ( TransitionEvent
        , decodeTransitionEvent
        , considerTransitionEvent
        , transitionStart
        , transitionEnd
        , transitionCancel
        )

{-| -}

import Json.Decode as Decode exposing (Decoder, float, field, string)
import Time exposing (Time)


{-| -}
type alias TransitionEvent =
    { propertyName : String
    , elapsedTime : Time
    }


{-| -}
decodeTransitionEvent : Decoder TransitionEvent
decodeTransitionEvent =
    Decode.map2 TransitionEvent
        (field "propertyName" string)
        decodeElapsedTime


{-| -}
decodeElapsedTime : Decoder Time
decodeElapsedTime =
    field "elapsedTime" float
        |> Decode.map ((*) Time.second)


{-| -}
considerTransitionEvent : (TransitionEvent -> Maybe msg) -> Decoder msg
considerTransitionEvent func =
    decodeTransitionEvent
        |> Decode.andThen
            (\event ->
                case func event of
                    Just msg ->
                        Decode.succeed msg

                    Nothing ->
                        Decode.fail "Ignoring transition event"
            )



---- Event names ----


{-| -}
transitionStart : String
transitionStart =
    "transitionstart"


{-| -}
transitionEnd : String
transitionEnd =
    "transitionend"


{-| -}
transitionCancel : String
transitionCancel =
    "transitioncancel"
