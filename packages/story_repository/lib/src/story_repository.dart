import 'package:story_api/story_api.dart';

/// {@template story_repository}
/// repository for story apis
/// {@endtemplate}
class StoryRepository {
  /// {@macro story_repository}
  const StoryRepository({required StoryApi storyApi}) : _storyApi = storyApi;

  final StoryApi _storyApi;

  Stream<List<UserStory>> getStories() => _storyApi.getStories();

  Future<void> markReelAsViewed(String storyId, String reelId) => _storyApi.markReelAsViewed(storyId, reelId);
}
