-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.Milestone exposing (IssuesOptionalArguments, PullRequestsOptionalArguments, closed, closedAt, createdAt, creator, description, dueOn, id, issues, number, pullRequests, repository, resourcePath, selection, state, title, updatedAt, url)

import Github.Enum.IssueState
import Github.Enum.MilestoneState
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Milestone
selection constructor =
    Object.selection constructor


{-| `true` if the object is closed (definition of closed may depend on type)
-}
closed : Field Bool Github.Object.Milestone
closed =
    Object.fieldDecoder "closed" [] Decode.bool


{-| Identifies the date and time when the object was closed.
-}
closedAt : Field (Maybe Github.Scalar.DateTime) Github.Object.Milestone
closedAt =
    Object.fieldDecoder "closedAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime |> Decode.nullable)


{-| Identifies the date and time when the object was created.
-}
createdAt : Field Github.Scalar.DateTime Github.Object.Milestone
createdAt =
    Object.fieldDecoder "createdAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime)


{-| Identifies the actor who created the milestone.
-}
creator : SelectionSet decodesTo Github.Interface.Actor -> Field (Maybe decodesTo) Github.Object.Milestone
creator object_ =
    Object.selectionField "creator" [] object_ (identity >> Decode.nullable)


{-| Identifies the description of the milestone.
-}
description : Field (Maybe String) Github.Object.Milestone
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.nullable)


{-| Identifies the due date of the milestone.
-}
dueOn : Field (Maybe Github.Scalar.DateTime) Github.Object.Milestone
dueOn =
    Object.fieldDecoder "dueOn" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime |> Decode.nullable)


id : Field Github.Scalar.Id Github.Object.Milestone
id =
    Object.fieldDecoder "id" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Id)


type alias IssuesOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , labels : OptionalArgument (List String)
    , orderBy : OptionalArgument Github.InputObject.IssueOrder
    , states : OptionalArgument (List Github.Enum.IssueState.IssueState)
    }


{-| A list of issues associated with the milestone.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - labels - A list of label names to filter the pull requests by.
  - orderBy - Ordering options for issues returned from the connection.
  - states - A list of states to filter the issues by.

-}
issues : (IssuesOptionalArguments -> IssuesOptionalArguments) -> SelectionSet decodesTo Github.Object.IssueConnection -> Field decodesTo Github.Object.Milestone
issues fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, labels = Absent, orderBy = Absent, states = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "labels" filledInOptionals.labels (Encode.string |> Encode.list), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeIssueOrder, Argument.optional "states" filledInOptionals.states (Encode.enum Github.Enum.IssueState.toString |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionField "issues" optionalArgs object_ identity


{-| Identifies the number of the milestone.
-}
number : Field Int Github.Object.Milestone
number =
    Object.fieldDecoder "number" [] Decode.int


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


{-| A list of pull requests associated with the milestone.

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
pullRequests : (PullRequestsOptionalArguments -> PullRequestsOptionalArguments) -> SelectionSet decodesTo Github.Object.PullRequestConnection -> Field decodesTo Github.Object.Milestone
pullRequests fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, states = Absent, labels = Absent, headRefName = Absent, baseRefName = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "states" filledInOptionals.states (Encode.enum Github.Enum.PullRequestState.toString |> Encode.list), Argument.optional "labels" filledInOptionals.labels (Encode.string |> Encode.list), Argument.optional "headRefName" filledInOptionals.headRefName Encode.string, Argument.optional "baseRefName" filledInOptionals.baseRefName Encode.string, Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeIssueOrder ]
                |> List.filterMap identity
    in
    Object.selectionField "pullRequests" optionalArgs object_ identity


{-| The repository associated with this milestone.
-}
repository : SelectionSet decodesTo Github.Object.Repository -> Field decodesTo Github.Object.Milestone
repository object_ =
    Object.selectionField "repository" [] object_ identity


{-| The HTTP path for this milestone
-}
resourcePath : Field Github.Scalar.Uri Github.Object.Milestone
resourcePath =
    Object.fieldDecoder "resourcePath" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Uri)


{-| Identifies the state of the milestone.
-}
state : Field Github.Enum.MilestoneState.MilestoneState Github.Object.Milestone
state =
    Object.fieldDecoder "state" [] Github.Enum.MilestoneState.decoder


{-| Identifies the title of the milestone.
-}
title : Field String Github.Object.Milestone
title =
    Object.fieldDecoder "title" [] Decode.string


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : Field Github.Scalar.DateTime Github.Object.Milestone
updatedAt =
    Object.fieldDecoder "updatedAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime)


{-| The HTTP URL for this milestone
-}
url : Field Github.Scalar.Uri Github.Object.Milestone
url =
    Object.fieldDecoder "url" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Uri)
