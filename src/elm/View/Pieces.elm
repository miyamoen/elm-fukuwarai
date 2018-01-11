module View.Pieces exposing (..)

import Element exposing (Element)
import TypedSvg exposing (svg, use)
import TypedSvg.Attributes exposing (viewBox, xlinkHref, fill, points, transform)
import TypedSvg.Attributes.InPx exposing (x, y, width, height)
import Svg.Symbol.Types exposing (..)
import Svg.Symbol.ElmLogo as ElmLogo
import Types exposing (..)


toElement : Pieces -> Element style variation msg
toElement piece =
    svg
        [ viewBox 0 0 (.width ElmLogo.size) (.height ElmLogo.size)
        , width <| .width ElmLogo.size
        , height <| .height ElmLogo.size
        ]
        [ use [ xlinkHref <| toSelector (ElmLogo piece) ] [] ]
        |> Element.html
