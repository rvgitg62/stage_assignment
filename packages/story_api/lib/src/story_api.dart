import 'model/user_story.dart';

/// {@template story_api}
/// api interfaces to implement story board api in stage application
/// {@endtemplate}
abstract class StoryApi {
  /// {@macro story_api}
  const StoryApi();

  Stream<List<UserStory>> getStories();

  Future<void> markReelAsViewed(String storyId, String reelId);
}
