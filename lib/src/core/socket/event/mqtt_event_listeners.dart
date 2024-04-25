import 'package:amity_sdk/src/core/socket/event/event.dart';
import 'package:amity_sdk/src/core/socket/event/post/post_approved_event_listener.dart';
import 'package:amity_sdk/src/core/socket/event/post/post_declined_event_listener.dart';
import 'package:amity_sdk/src/core/socket/event/story/story_reaction_added_event_listerner.dart';
import 'package:amity_sdk/src/core/socket/event/story/story_create_event_listener.dart';
import 'package:amity_sdk/src/core/socket/event/story/story_delete_event_listener.dart';
import 'package:amity_sdk/src/core/socket/event/story/story_reaction_removed_event_listener.dart';
import 'package:collection/collection.dart' show IterableExtension;

class MqttEventListeners {
  final listeners = List.of([
    ///Post Event
    PostCreateEventListener(),
    PostUpdateEventListener(),
    PostDeleteEventListener(),
    PostAddReactionEventListener(),
    PostRemoveReactionEventListener(),
    PostFlaggedEventListener(),
    PostUnflaggedEventListener(),
    PostApprovedEventListener(),
    PostDeclinedEventListener(),

    ///Comment Event
    CommentCreateEventListener(),
    CommentUpdateEventListener(),
    CommentDeleteEventListener(),
    CommentAddReactionEventListener(),
    CommentRemoveReactionEventListener(),
    CommentFlaggedEventListener(),
    CommentUnflaggedEventListener(),

    ///Community Event
    CommunityCreateEventListener(),
    CommunityUpdateEventListener(),
    CommunityDeleteEventListener(),

    /// Community Member Event
    CommunityJoinEventListener(),
    CommunityLeftEventListener(),
    CommunityUserAddedEventListener(),
    CommunityUserRemovedEventListener(),
    CommunityRoleAddedEventListener(),
    CommunityRoleRemovedEventListener(),
    CommunityUserChangedEventListener(),
    CommunityUserBannedEventListener(),
    CommunityUserUnbannedEventListener(),

    // Stories 
    StoryCreateEventListener(),
    StoryDeleteEventListener(),
    StoryReactionAddedEventListener(),
    StoryReactionRemovedEventListener(),
    

  ]);

  SocketEventListener? getEvent(String eventType) =>
      listeners.firstWhereOrNull((element) => element.getEventName() == eventType);
}
