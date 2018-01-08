module Style.Easing exposing (..)


type Easing
    = Ease
    | EaseIn
    | EaseOut
    | EaseInOut
    | Bezier Float Float Float Float
    | Linear
    | StepStart
    | StepEnd
    | Steps Int Direction


type Direction
    = Start
    | End


toString : Easing -> String
toString func =
    case func of
        Ease ->
            "ease"

        EaseIn ->
            "ease-in"

        EaseOut ->
            "ease-out"

        EaseInOut ->
            "ease-in-out"

        Bezier x1 y1 x2 y2 ->
            String.concat
                [ "cubic-bezier("
                , String.join ", " <| List.map Basics.toString [ x1, y1, x2, y2 ]
                , ")"
                ]

        Linear ->
            "linear"

        StepStart ->
            "step-start"

        StepEnd ->
            "step-end"

        Steps count dir ->
            String.concat [ "steps(", Basics.toString count, ", ", directionToCss dir, ")" ]


directionToCss : Direction -> String
directionToCss dir =
    case dir of
        Start ->
            "start"

        End ->
            "end"
