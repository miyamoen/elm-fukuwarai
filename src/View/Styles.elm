module View.Styles exposing (..)

import Style exposing (..)
import Style.Font as Font
import Style.Color as Color
import Style.Shadow as Shadow
import Style.Border as Border
import Style.Transition as Transition exposing (Transition)
import Color exposing (Color, rgba)
import Colors


type Styles
    = None


styleSheet : StyleSheet Styles variation
styleSheet =
    Style.styleSheet
        [ style None [] ]
