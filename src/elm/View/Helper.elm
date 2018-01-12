module View.Helper exposing (..)

import Rocket exposing ((=>))


type Transforms
    = Translate Float Float
    | Scale Float Float
    | Rotate Float


transforms : List Transforms -> ( String, String )
transforms list =
    "transform"
        => (List.map transform list
                |> String.join " "
           )


transform : Transforms -> String
transform form =
    case form of
        Translate x y ->
            "translate(" ++ toString x ++ "px," ++ toString y ++ "px)"

        Scale x y ->
            "scale(" ++ toString x ++ "," ++ toString y ++ ")"

        Rotate rad ->
            "rotate(" ++ toString rad ++ "rad)"


transformOrigin : number -> number -> ( String, String )
transformOrigin x y =
    "transform-origin" => toString x ++ "px " ++ toString y ++ "px"
