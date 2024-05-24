// ignore_for_file: constant_identifier_names, public_member_api_docs

enum AmityPermission {
  BAN_USER,
  EDIT_USER,
  CREATE_ROLE,
  DELETE_ROLE,
  EDIT_USER_FEED_POST,
  DELETE_USER_FEED_POST,
  EDIT_USER_FEED_COMMENT,
  DELETE_USER_FEED_COMMENT,
  ADD_COMMUNITY_USER,
  REMOVE_COMMUNITY_USER,
  EDIT_COMMUNITY_USER,
  BAN_COMMUNITY_USER,
  MUTE_COMMUNITY_USER,
  EDIT_COMMUNITY,
  EDIT_COMMUNITY_POST,
  DELETE_COMMUNITY_POST,
  PIN_COMMUNITY_POST,
  EDIT_COMMUNITY_COMMENT,
  DELETE_COMMUNITY_COMMENT,
  REVIEW_COMMUNITY_POST,
  MUTE_CHANNEL,
  CLOSE_CHANNEL,
  EDIT_CHANNEL,
  EDIT_CHANNEL_RATELIMIT,
  BAN_USER_FROM_CHANNEL,
  MUTE_USER_INSIDE_CHANNEL,
  ADD_CHANNEL_USER,
  REMOVE_CHANNEL_USER,
  EDIT_CHANNEL_USER,
  MANAGE_COMMUNITY_STORY
}

extension AmityPermissionExtension on AmityPermission {

  // String get value {
  //   return AmityPermission.values[index].name;
  
  // }

  String get value {
    return [
      'BAN_USER',
      'EDIT_USER',
      'CREATE_ROLE',
      'DELETE_ROLE',
      'EDIT_USER_FEED_POST',
      'DELETE_USER_FEED_POST',
      'EDIT_USER_FEED_COMMENT',
      'DELETE_USER_FEED_COMMENT',
      'ADD_COMMUNITY_USER',
      'REMOVE_COMMUNITY_USER',
      'EDIT_COMMUNITY_USER',
      'BAN_COMMUNITY_USER',
      'MUTE_COMMUNITY_USER',
      'EDIT_COMMUNITY',
      'EDIT_COMMUNITY_POST',
      'DELETE_COMMUNITY_POST',
      'PIN_COMMUNITY_POST',
      'EDIT_COMMUNITY_COMMENT',
      'DELETE_COMMUNITY_COMMENT',
      'REVIEW_COMMUNITY_POST',
      'CLOSE_CHANNEL',
      'CLOSE_CHANNEL',
      'EDIT_CHANNEL',
      'EDIT_CHANNEL_RATELIMIT',
      'BAN_USER_FROM_CHANNEL',
      'MUTE_USER_INSIDE_CHANNEL',
      'ADD_CHANNEL_USER',
      'REMOVE_CHANNEL_USER',
      'EDIT_CHANNEL_USER',
      'MANAGE_COMMUNITY_STORY'
    ][index];
  }

  static AmityPermission enumOf(String value) {
    return AmityPermission.values.firstWhere(
      (element) => element.name.toLowerCase() == value.toLowerCase(),
    );
  }
}
