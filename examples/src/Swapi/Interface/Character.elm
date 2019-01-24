-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Swapi.Interface.Character exposing (Fragments, appearsIn, avatarUrl, fragments, friends, id, maybeFragments, name)

import CustomScalarDecoders
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (FragmentSelectionSet(..), SelectionSet(..))
import Json.Decode as Decode
import Swapi.Enum.Episode
import Swapi.InputObject
import Swapi.Interface
import Swapi.Object
import Swapi.Scalar
import Swapi.Union


type alias Fragments decodesTo =
    { onHuman : SelectionSet decodesTo Swapi.Object.Human
    , onDroid : SelectionSet decodesTo Swapi.Object.Droid
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
    Fragments decodesTo
    -> SelectionSet decodesTo Swapi.Interface.Character
fragments selections =
    Object.exhuastiveFragmentSelection
        [ Object.buildFragment "Human" selections.onHuman
        , Object.buildFragment "Droid" selections.onDroid
        ]


{-| Can be used to create a non-exhuastive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    { onHuman = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onDroid = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


{-| Which movies they appear in.
-}
appearsIn : SelectionSet (List Swapi.Enum.Episode.Episode) Swapi.Interface.Character
appearsIn =
    Object.selectionForField "(List Enum.Episode.Episode)" "appearsIn" [] (Swapi.Enum.Episode.decoder |> Decode.list)


{-| Url to a profile picture for the character.
-}
avatarUrl : SelectionSet String Swapi.Interface.Character
avatarUrl =
    Object.selectionForField "String" "avatarUrl" [] Decode.string


{-| The friends of the character, or an empty list if they have none.
-}
friends : SelectionSet decodesTo Swapi.Interface.Character -> SelectionSet (List decodesTo) Swapi.Interface.Character
friends object_ =
    Object.selectionForCompositeField "friends" [] object_ (identity >> Decode.list)


{-| The ID of the character.
-}
id : SelectionSet CustomScalarDecoders.Id Swapi.Interface.Character
id =
    Object.selectionForField "CustomScalarDecoders.Id" "id" [] (CustomScalarDecoders.decoders |> Swapi.Scalar.unwrapDecoders |> .codecId |> .decoder)


{-| The name of the character.
-}
name : SelectionSet String Swapi.Interface.Character
name =
    Object.selectionForField "String" "name" [] Decode.string
