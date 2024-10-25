// ignore_for_file: non_constant_identifier_names

import 'package:amity_sdk/amity_sdk.dart';

abstract class AmityTopic {
  AmityTopic._(this.nonce, this.id, this.events);

  final String nonce;
  final String id;
  final String events;

  String getKey() => nonce + id + events;

  factory AmityTopic.POST(AmityPost amityPost, AmityPostEvents events) = AmityTopicPost;

  factory AmityTopic.COMMENT(AmityComment amityComment, AmityCommentEvents events) = AmityTopicComment;

  factory AmityTopic.COMMUNITY(AmityCommunity amityCommunity, AmityCommunityEvents events) = AmityTopicCommunity;

  factory AmityTopic.NETWORK(String networkId) = AmityTopicNetwork;

  factory AmityTopic.STORY(AmityStory story) = AmityTopicStory;

  factory AmityTopic.SUB_CHANNEL(AmitySubChannel story) = AmityTopicSubChannel;

  factory AmityTopic.SMART_CHANNEL(String networkId, String userId) = AmityTopicSmartChannel;

  factory AmityTopic.SMART_SUBCHANNEL(String networkId, String userId) = AmityTopicSmartSubchannel;

  factory AmityTopic.SMART_MESSAGE(String networkId, String userId) = AmityTopicSmartMessage;

  /// Generate topic
  String generateTopic();

  @override
  int get hashCode => getKey().hashCode;

  @override
  bool operator ==(Object other) {
    return other is AmityTopic && other.getKey() == getKey();
  }

  @override
  String toString() {
    return 'topic - ${generateTopic()}';
  }
}

///  Amity Topic for post
class AmityTopicPost extends AmityTopic {
  final AmityPost amityPost;
  final AmityPostEvents event;
  AmityTopicPost(this.amityPost, this.event) : super._('post', amityPost.postId!, event.name);

  @override
  String generateTopic() {
    switch (event) {
      case AmityPostEvents.POST:
        return amityPost.path!;
      case AmityPostEvents.COMMENTS:
        return '${amityPost.path}/comment/+';
    }
  }
}

///  Amity Topic for Network
class AmityTopicNetwork extends AmityTopic {
  AmityTopicNetwork(String networkId) : super._('network', networkId, "");

  @override
  String generateTopic() {
    return id;
  }
}

///  Amity Topic for Story
class AmityTopicStory extends AmityTopic {
  AmityStory story;
  AmityTopicStory( this.story) : super._('story', story.storyId??"", "");

  @override
  String generateTopic() {
    return '${story.path}/#';
  }
}

/// Amity Topic for comment
class AmityTopicComment extends AmityTopic {
  final AmityComment amityComment;
  final AmityCommentEvents event;
  AmityTopicComment(this.amityComment, this.event) : super._('comment', amityComment.commentId!, event.name);

  @override
  String generateTopic() {
    switch (event) {
      case AmityCommentEvents.COMMENT:
        return amityComment.path!;
    }
  }
}



class AmityTopicSubChannel extends AmityTopic {
  final AmitySubChannel amitySubChannel;
  AmityTopicSubChannel(this.amitySubChannel) : super._('sub_channel', amitySubChannel.channelId!, "");

  @override
  String generateTopic() {
    return '${amitySubChannel.path}/#';
  }
}

/// Amity Topic for Community
class AmityTopicCommunity extends AmityTopic {
  final AmityCommunity amityCommunity;
  final AmityCommunityEvents event;
  AmityTopicCommunity(this.amityCommunity, this.event) : super._('community', amityCommunity.communityId!, event.name);

  @override
  String generateTopic() {
    switch (event) {
      case AmityCommunityEvents.COMMUNITY:
        return amityCommunity.path!;
      case AmityCommunityEvents.POSTS:
        return "${amityCommunity.path!}/post/+";
      case AmityCommunityEvents.COMMENTS:
        return "${amityCommunity.path!}/post/+/comment/+";
      case AmityCommunityEvents.POSTS_AND_COMMENTS:
        return "${amityCommunity.path!}/post/#";
      case AmityCommunityEvents.STORIES_AND_COMMENTS:
        return "${amityCommunity.path!}/story/#";
    }
  }
}

///  Amity Topic for Smart channel
class AmityTopicSmartChannel extends AmityTopic {
  String networkId;
  String userId;

  AmityTopicSmartChannel(this.networkId, this.userId) : super._('smart_channel', networkId, "");

  @override
  String generateTopic() {
    return "${networkId}/smartfeed/${userId}/channels";
  }
}

///  Amity Topic for Smart Subchannel
class AmityTopicSmartSubchannel extends AmityTopic {
  String networkId;
  String userId;

  AmityTopicSmartSubchannel(this.networkId, this.userId) : super._('smart_subchannel', networkId, "");

  @override
  String generateTopic() {
    return "${networkId}/smartfeed/${userId}/messagefeeds";
  }
}


///  Amity Topic for Smart message
class AmityTopicSmartMessage extends AmityTopic {
  String networkId;
  String userId;

  AmityTopicSmartMessage(this.networkId, this.userId) : super._('smart_message', networkId, "");

  @override
  String generateTopic() {
    return "${networkId}/smartfeed/${userId}/messages";
  }
}