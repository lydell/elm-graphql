-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Interface.Starrable exposing (Fragments, StargazersOptionalArguments, fragments, id, maybeFragments, selection, stargazers, viewerHasStarred)

import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.Union
import Graphql.Field as Field exposing (Field)
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (FragmentSelectionSet(..), SelectionSet(..))
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this Interface.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Interface.Starrable
selection constructor =
    Object.selection constructor


type alias Fragments decodesTo =
    { onGist : SelectionSet decodesTo Github.Object.Gist
    , onRepository : SelectionSet decodesTo Github.Object.Repository
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
    Fragments decodesTo
    -> SelectionSet decodesTo Github.Interface.Starrable
fragments selections =
    Object.exhuastiveFragmentSelection
        [ Object.buildFragment "Gist" selections.onGist
        , Object.buildFragment "Repository" selections.onRepository
        ]


{-| Can be used to create a non-exhuastive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe a)
maybeFragments =
    { onGist = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onRepository = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


id : Field Github.Scalar.Id Github.Interface.Starrable
id =
    Object.fieldDecoder "id" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Id)


type alias StargazersOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , orderBy : OptionalArgument Github.InputObject.StarOrder
    }


{-| A list of users who have starred this starrable.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - orderBy - Order for connection

-}
stargazers : (StargazersOptionalArguments -> StargazersOptionalArguments) -> SelectionSet decodesTo Github.Object.StargazerConnection -> Field decodesTo Github.Interface.Starrable
stargazers fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeStarOrder ]
                |> List.filterMap identity
    in
    Object.selectionField "stargazers" optionalArgs object_ identity


{-| Returns a boolean indicating whether the viewing user has starred this starrable.
-}
viewerHasStarred : Field Bool Github.Interface.Starrable
viewerHasStarred =
    Object.fieldDecoder "viewerHasStarred" [] Decode.bool
