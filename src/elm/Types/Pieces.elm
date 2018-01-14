module Types.Pieces exposing (..)

import Random exposing (Generator)
import Types exposing (..)
import Svg.Symbol.Types as Symbol exposing (Pieces(..))
import Svg.Symbol.ElmLogo exposing (size)


model : Types.Pieces
model =
    Pieces
        (Piece (getCenter One) 0 One)
        (Piece (getCenter Two) 0 Two)
        (Piece (getCenter Three) 0 Three)
        (Piece (getCenter Four) 0 Four)
        (Piece (getCenter Five) 0 Five)
        (Piece (getCenter Six) 0 Six)
        (Piece (getCenter Seven) 0 Seven)


getCenter : Symbol.Pieces -> Position
getCenter piece =
    case piece of
        All ->
            { x = size.width / 2, y = size.height / 2 }

        One ->
            { x = (323.298 + 323.298 + 179.573) / 3, y = 143.724 / 3 }

        Two ->
            { x = 8.867 + (232.213 - 8.867) / 2, y = 70.375 / 2 }

        Three ->
            { x = (91.783 + 231.514 + 161.649) / 3, y = (82.916 + 152.782 + 82.916) / 3 }

        Four ->
            { x = 192.99 + 107.676 / 2, y = 107.392 + 108.167 / 2 }

        Five ->
            { x = (255.522 + 323.298 + 323.298) / 3, y = (178.879 + 314.432 + 246.655) / 3 }

        Six ->
            { x = 152.781 / 3, y = (8.868 + 314.432 + 161.649) / 3 }

        Seven ->
            { x = (8.869 + 314.43 + 161.649) / 3, y = (170.517 + 323.298 + 323.298) / 3 }


toList : Types.Pieces -> List Piece
toList pieces =
    [ pieces.one, pieces.two, pieces.three, pieces.four, pieces.five, pieces.six, pieces.seven ]


toGetter : Symbol.Pieces -> (Types.Pieces -> Piece)
toGetter piece =
    case piece of
        One ->
            .one

        Two ->
            .two

        Three ->
            .three

        Four ->
            .four

        Five ->
            .five

        Six ->
            .six

        Seven ->
            .seven

        All ->
            Debug.crash "Don't use All symbol"


update : Symbol.Pieces -> (Piece -> Piece) -> Types.Pieces -> Types.Pieces
update id tagger pieces =
    case id of
        One ->
            { pieces | one = tagger pieces.one }

        Two ->
            { pieces | two = tagger pieces.two }

        Three ->
            { pieces | three = tagger pieces.three }

        Four ->
            { pieces | four = tagger pieces.four }

        Five ->
            { pieces | five = tagger pieces.five }

        Six ->
            { pieces | six = tagger pieces.six }

        Seven ->
            { pieces | seven = tagger pieces.seven }

        All ->
            Debug.crash "Don't use All symbol"



---- Random ----


positionGenerator : Size -> Generator Position
positionGenerator { width, height } =
    Random.map2 Position
        (Random.float 20 <| toFloat <| width - 20)
        (Random.float 20 <| toFloat <| height - 20)


degreeGenerator : Generator Float
degreeGenerator =
    Random.int 0 (360 // 5 - 1)
        |> Random.map (\int -> toFloat int * 5)


toPiecesGenerator : Size -> Generator (List (Symbol.Pieces -> Piece))
toPiecesGenerator size =
    Random.map2 Piece (positionGenerator size) degreeGenerator
        |> Random.list 7


piecesGenerator : Size -> Generator Types.Pieces
piecesGenerator size =
    toPiecesGenerator size
        |> Random.map
            (\toPieces ->
                case toPieces of
                    one :: two :: three :: four :: five :: six :: seven :: [] ->
                        Pieces
                            (one One)
                            (two Two)
                            (three Three)
                            (four Four)
                            (five Five)
                            (six Six)
                            (seven Seven)

                    _ ->
                        Debug.crash "random mistake"
            )
