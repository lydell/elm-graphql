-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Normalize.Object.Dog exposing (id)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Normalize.InputObject
import Normalize.Interface
import Normalize.Object
import Normalize.Scalar
import Normalize.ScalarCodecs
import Normalize.Union


id : SelectionSet Normalize.ScalarCodecs.DogId Normalize.Object.Dog
id =
    Object.selectionForField "ScalarCodecs.DogId" "id" [] (Normalize.ScalarCodecs.codecs |> Normalize.Scalar.unwrapCodecs |> .codecDogId |> .decoder)
