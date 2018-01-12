module View.Pieces exposing (..)

import Json.Decode as Json
import Element exposing (Element, el)
import Element.Attributes exposing (inlineStyle)
import TypedSvg exposing (svg, use)
import TypedSvg.Events exposing (on)
import TypedSvg.Attributes exposing (viewBox, xlinkHref, fill, points, pointerEvents)
import TypedSvg.Attributes.InPx exposing (x, y, width, height)
import Svg.Symbol.Types as Symbol exposing (..)
import Svg.Symbol.ElmLogo as ElmLogo
import Types exposing (..)
import Types.Pieces as Pieces
import View.Helper exposing (..)
import Styles exposing (Styles)
import Rocket exposing ((=>))


toElement : Piece -> Element Styles variation Msg
toElement { id, position, degree } =
    let
        center =
            Pieces.getCenter id
    in
        el Styles.Pieces
            [ inlineStyle
                [ transformOrigin center.x center.y
                , transforms
                    [ Translate (position.x - center.x) (position.y - center.y)
                    , Rotate <| degrees degree
                    ]
                , "pointer-events" => "none"
                ]
            ]
        <|
            Element.html <|
                svg
                    [ viewBox 0 0 (.width ElmLogo.size) (.height ElmLogo.size)
                    , width <| .width ElmLogo.size
                    , height <| .height ElmLogo.size
                    , pointerEvents "none"
                    ]
                    [ use
                        [ xlinkHref <| toSelector (ElmLogo id)
                        , on "click" <| Json.succeed (FocusOn id)
                        , pointerEvents "auto"
                        ]
                        []
                    ]
