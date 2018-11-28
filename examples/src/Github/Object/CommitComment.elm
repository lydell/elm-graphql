-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.CommitComment exposing (ReactionsOptionalArguments, UserContentEditsOptionalArguments, author, authorAssociation, body, bodyHTML, commit, createdAt, createdViaEmail, databaseId, editor, id, lastEditedAt, path, position, publishedAt, reactionGroups, reactions, repository, resourcePath, selection, updatedAt, url, userContentEdits, viewerCanDelete, viewerCanReact, viewerCanUpdate, viewerCannotUpdateReasons, viewerDidAuthor)

import Github.Enum.CommentAuthorAssociation
import Github.Enum.CommentCannotUpdateReason
import Github.Enum.ReactionContent
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.CommitComment
selection constructor =
    Object.selection constructor


{-| The actor who authored the comment.
-}
author : SelectionSet decodesTo Github.Interface.Actor -> Field (Maybe decodesTo) Github.Object.CommitComment
author object_ =
    Object.selectionField "author" [] object_ (identity >> Decode.nullable)


{-| Author's association with the subject of the comment.
-}
authorAssociation : Field Github.Enum.CommentAuthorAssociation.CommentAuthorAssociation Github.Object.CommitComment
authorAssociation =
    Object.fieldDecoder "authorAssociation" [] Github.Enum.CommentAuthorAssociation.decoder


{-| Identifies the comment body.
-}
body : Field String Github.Object.CommitComment
body =
    Object.fieldDecoder "body" [] Decode.string


{-| Identifies the comment body rendered to HTML.
-}
bodyHTML : Field Github.Scalar.Html Github.Object.CommitComment
bodyHTML =
    Object.fieldDecoder "bodyHTML" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Html)


{-| Identifies the commit associated with the comment, if the commit exists.
-}
commit : SelectionSet decodesTo Github.Object.Commit -> Field (Maybe decodesTo) Github.Object.CommitComment
commit object_ =
    Object.selectionField "commit" [] object_ (identity >> Decode.nullable)


{-| Identifies the date and time when the object was created.
-}
createdAt : Field Github.Scalar.DateTime Github.Object.CommitComment
createdAt =
    Object.fieldDecoder "createdAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime)


{-| Check if this comment was created via an email reply.
-}
createdViaEmail : Field Bool Github.Object.CommitComment
createdViaEmail =
    Object.fieldDecoder "createdViaEmail" [] Decode.bool


{-| Identifies the primary key from the database.
-}
databaseId : Field (Maybe Int) Github.Object.CommitComment
databaseId =
    Object.fieldDecoder "databaseId" [] (Decode.int |> Decode.nullable)


{-| The actor who edited the comment.
-}
editor : SelectionSet decodesTo Github.Interface.Actor -> Field (Maybe decodesTo) Github.Object.CommitComment
editor object_ =
    Object.selectionField "editor" [] object_ (identity >> Decode.nullable)


id : Field Github.Scalar.Id Github.Object.CommitComment
id =
    Object.fieldDecoder "id" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Id)


{-| The moment the editor made the last edit
-}
lastEditedAt : Field (Maybe Github.Scalar.DateTime) Github.Object.CommitComment
lastEditedAt =
    Object.fieldDecoder "lastEditedAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime |> Decode.nullable)


{-| Identifies the file path associated with the comment.
-}
path : Field (Maybe String) Github.Object.CommitComment
path =
    Object.fieldDecoder "path" [] (Decode.string |> Decode.nullable)


{-| Identifies the line position associated with the comment.
-}
position : Field (Maybe Int) Github.Object.CommitComment
position =
    Object.fieldDecoder "position" [] (Decode.int |> Decode.nullable)


{-| Identifies when the comment was published at.
-}
publishedAt : Field (Maybe Github.Scalar.DateTime) Github.Object.CommitComment
publishedAt =
    Object.fieldDecoder "publishedAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime |> Decode.nullable)


{-| A list of reactions grouped by content left on the subject.
-}
reactionGroups : SelectionSet decodesTo Github.Object.ReactionGroup -> Field (Maybe (List decodesTo)) Github.Object.CommitComment
reactionGroups object_ =
    Object.selectionField "reactionGroups" [] object_ (identity >> Decode.list >> Decode.nullable)


type alias ReactionsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , content : OptionalArgument Github.Enum.ReactionContent.ReactionContent
    , orderBy : OptionalArgument Github.InputObject.ReactionOrder
    }


{-| A list of Reactions left on the Issue.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - content - Allows filtering Reactions by emoji.
  - orderBy - Allows specifying the order in which reactions are returned.

-}
reactions : (ReactionsOptionalArguments -> ReactionsOptionalArguments) -> SelectionSet decodesTo Github.Object.ReactionConnection -> Field decodesTo Github.Object.CommitComment
reactions fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, content = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "content" filledInOptionals.content (Encode.enum Github.Enum.ReactionContent.toString), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeReactionOrder ]
                |> List.filterMap identity
    in
    Object.selectionField "reactions" optionalArgs object_ identity


{-| The repository associated with this node.
-}
repository : SelectionSet decodesTo Github.Object.Repository -> Field decodesTo Github.Object.CommitComment
repository object_ =
    Object.selectionField "repository" [] object_ identity


{-| The HTTP path permalink for this commit comment.
-}
resourcePath : Field Github.Scalar.Uri Github.Object.CommitComment
resourcePath =
    Object.fieldDecoder "resourcePath" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Uri)


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : Field Github.Scalar.DateTime Github.Object.CommitComment
updatedAt =
    Object.fieldDecoder "updatedAt" [] (Object.scalarDecoder |> Decode.map Github.Scalar.DateTime)


{-| The HTTP URL permalink for this commit comment.
-}
url : Field Github.Scalar.Uri Github.Object.CommitComment
url =
    Object.fieldDecoder "url" [] (Object.scalarDecoder |> Decode.map Github.Scalar.Uri)


type alias UserContentEditsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of edits to this content.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
userContentEdits : (UserContentEditsOptionalArguments -> UserContentEditsOptionalArguments) -> SelectionSet decodesTo Github.Object.UserContentEditConnection -> Field (Maybe decodesTo) Github.Object.CommitComment
userContentEdits fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionField "userContentEdits" optionalArgs object_ (identity >> Decode.nullable)


{-| Check if the current viewer can delete this object.
-}
viewerCanDelete : Field Bool Github.Object.CommitComment
viewerCanDelete =
    Object.fieldDecoder "viewerCanDelete" [] Decode.bool


{-| Can user react to this subject
-}
viewerCanReact : Field Bool Github.Object.CommitComment
viewerCanReact =
    Object.fieldDecoder "viewerCanReact" [] Decode.bool


{-| Check if the current viewer can update this object.
-}
viewerCanUpdate : Field Bool Github.Object.CommitComment
viewerCanUpdate =
    Object.fieldDecoder "viewerCanUpdate" [] Decode.bool


{-| Reasons why the current viewer can not update this comment.
-}
viewerCannotUpdateReasons : Field (List Github.Enum.CommentCannotUpdateReason.CommentCannotUpdateReason) Github.Object.CommitComment
viewerCannotUpdateReasons =
    Object.fieldDecoder "viewerCannotUpdateReasons" [] (Github.Enum.CommentCannotUpdateReason.decoder |> Decode.list)


{-| Did the viewer author this comment.
-}
viewerDidAuthor : Field Bool Github.Object.CommitComment
viewerDidAuthor =
    Object.fieldDecoder "viewerDidAuthor" [] Decode.bool
