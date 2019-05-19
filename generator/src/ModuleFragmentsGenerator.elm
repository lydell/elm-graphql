module ModuleFragmentsGenerator exposing (init)

import Ast.Canonical
import Base64
import Bytes.Decode
import Bytes.Decode.ElmFile.Interface
import Bytes.Encode
import Debug
import Dict
import ElmFile.Interface
import ElmFile.Module
import ElmFile.Package


type Error
    = DecodingError
    | EncodingBase64Failed


init : String -> Result Error (List ExposedSelectionSet)
init elmi =
    let
        interface =
            Base64.toBytes elmi
                |> Result.fromMaybe EncodingBase64Failed
                |> Result.andThen
                    (\decodedElmi ->
                        decodedElmi
                            |> Bytes.Decode.decode (Bytes.Decode.ElmFile.Interface.interface logger)
                            |> Result.fromMaybe DecodingError
                    )
    in
    interface
        |> Result.map (\(ElmFile.Interface.Interface i) -> i)
        |> Result.map .types_
        |> Result.map
            (Dict.foldl
                (\functionName (Ast.Canonical.Annotation _ t) accumulator ->
                    maybeSelectionSetAnnotation functionName t :: accumulator
                )
                []
            )
        |> Result.map (List.filterMap identity)


type Level
    = Query
    | Mutation
    | Subscription


type alias Name =
    { functionName : String
    , moduleName : String
    }


type ExposedSelectionSet
    = ExposedSelectionSet Name Level Ast.Canonical.Type


maybeSelectionSetAnnotation : String -> Ast.Canonical.Type -> Maybe ExposedSelectionSet
maybeSelectionSetAnnotation functionName type_ =
    case type_ of
        Ast.Canonical.TType moduleName "SelectionSet" typeParameters ->
            case moduleName of
                ElmFile.Module.Name details ->
                    if details.module_ == "Graphql.SelectionSet" then
                        case typeParameters of
                            [ level, selectionType ] ->
                                ExposedSelectionSet { functionName = functionName, moduleName = "TODO" } Query selectionType
                                    |> Just

                            _ ->
                                Nothing

                    else
                        Nothing

        _ ->
            Nothing


logger : Int -> Int -> never
logger upper lower =
    Debug.todo ("64 bit number found in binary (" ++ String.fromInt upper ++ " << 32 + " ++ String.fromInt lower ++ ")")