enum AmityGlobalStoryTargetsQueryOption{
   UNSEEN,
    SEEN,
    ALL,
    SMART;
}

extension AmityGlobalStoryTargetsQueryOptionExtension on AmityGlobalStoryTargetsQueryOption {
  String get value {
    return AmityGlobalStoryTargetsQueryOption.values[index].name.toLowerCase();
  
  }


  static AmityGlobalStoryTargetsQueryOption enumOf(String value) {
    return AmityGlobalStoryTargetsQueryOption.values.firstWhere(
      (element) => element.name.toLowerCase() == value.toLowerCase(),
      orElse: () => AmityGlobalStoryTargetsQueryOption.SMART,
    );
  }

}