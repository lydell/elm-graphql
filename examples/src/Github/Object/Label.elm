-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.Label exposing (IssuesOptionalArguments, PullRequestsOptionalArguments, color, description, id, isDefault, issues, name, pullRequests, repository, selection)

import Github.Enum.IssueState
import Github.Enum.PullRequestState
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
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Label
selection constructor =
    Object.selection constructor


{-| Identifies the label color.
-}
color : Field String Github.Object.Label
color =
    Object.fieldDecoder "color" [] Decode.string


{-| A brief description of this label.
-}
description : Field (Maybe String) Github.Object.Label
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.nullable)


id : Field Github.Scalar.Id Github.Object.Label
id =
    Object.fieldDecoder "id" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Id)


{-| Indicates whether or not this is a default label.
-}
isDefault : Field Bool Github.Object.Label
isDefault =
    Object.fieldDecoder "isDefault" [] Decode.bool


type alias IssuesOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , labels : OptionalArgument (List String)
    , orderBy : OptionalArgument Github.InputObject.IssueOrder
    , states : OptionalArgument (List Github.Enum.IssueState.IssueState)
    }


{-| A list of issues associated with this label.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - labels - A list of label names to filter the pull requests by.
  - orderBy - Ordering options for issues returned from the connection.
  - states - A list of states to filter the issues by.

-}
issues : (IssuesOptionalArguments -> IssuesOptionalArguments) -> SelectionSet decodesTo Github.Object.IssueConnection -> Field decodesTo Github.Object.Label
issues fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, labels = Absent, orderBy = Absent, states = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "labels" filledInOptionals.labels (Encode.string |> Encode.list), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeIssueOrder, Argument.optional "states" filledInOptionals.states (Encode.enum Github.Enum.IssueState.toString |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionField "issues" optionalArgs object_ identity


{-| Identifies the label name.
-}
name : Field String Github.Object.Label
name =
    Object.fieldDecoder "name" [] Decode.string


type alias PullRequestsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , states : OptionalArgument (List Github.Enum.PullRequestState.PullRequestState)
    , labels : OptionalArgument (List String)
    , headRefName : OptionalArgument String
    , baseRefName : OptionalArgument String
    , orderBy : OptionalArgument Github.InputObject.IssueOrder
    }


{-| A list of pull requests associated with this label.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - states - A list of states to filter the pull requests by.
  - labels - A list of label names to filter the pull requests by.
  - headRefName - The head ref name to filter the pull requests by.
  - baseRefName - The base ref name to filter the pull requests by.
  - orderBy - Ordering options for pull requests returned from the connection.

-}
pullRequests : (PullRequestsOptionalArguments -> PullRequestsOptionalArguments) -> SelectionSet decodesTo Github.Object.PullRequestConnection -> Field decodesTo Github.Object.Label
pullRequests fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, states = Absent, labels = Absent, headRefName = Absent, baseRefName = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "states" filledInOptionals.states (Encode.enum Github.Enum.PullRequestState.toString |> Encode.list), Argument.optional "labels" filledInOptionals.labels (Encode.string |> Encode.list), Argument.optional "headRefName" filledInOptionals.headRefName Encode.string, Argument.optional "baseRefName" filledInOptionals.baseRefName Encode.string, Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeIssueOrder ]
                |> List.filterMap identity
    in
    Object.selectionField "pullRequests" optionalArgs object_ identity


{-| The repository associated with this label.
-}
repository : SelectionSet decodesTo Github.Object.Repository -> Field decodesTo Github.Object.Label
repository object_ =
    Object.selectionField "repository" [] object_ identity
