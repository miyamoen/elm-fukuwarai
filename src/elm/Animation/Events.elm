module Animation.Events
    exposing
        ( AnimationEvent
        , decodeAnimationEvent
        , considerAnimationEvent
        , animationStart
        , animationIteration
        , animationEnd
        , animationCancel
        )

{-| -}

import Json.Decode as Decode exposing (Decoder, float, field, string)
import Time exposing (Time)


{-| -}
type alias AnimationEvent =
    { name : String
    , elapsedTime : Time
    }


{-| -}
decodeAnimationEvent : Decoder AnimationEvent
decodeAnimationEvent =
    Decode.map2 AnimationEvent
        (field "animationName" string)
        decodeElapsedTime


{-| -}
decodeElapsedTime : Decoder Time
decodeElapsedTime =
    field "elapsedTime" float
        |> Decode.map ((*) Time.second)


{-| -}
considerAnimationEvent : (AnimationEvent -> Maybe msg) -> Decoder msg
considerAnimationEvent func =
    decodeAnimationEvent
        |> Decode.andThen
            (\event ->
                case func event of
                    Just msg ->
                        Decode.succeed msg

                    Nothing ->
                        Decode.fail "Ignoring animation event"
            )



---- Event names ----


{-| -}
animationStart : String
animationStart =
    "animationstart"


{-| -}
animationEnd : String
animationEnd =
    "animationend"


{-| -}
animationIteration : String
animationIteration =
    "animationiteration"


{-| -}
animationCancel : String
animationCancel =
    "animationcancel"
