import 'package:story_api/story_api.dart';
import 'package:story_api_impl/src/dummy/data.dart';

/// {@template story_api_impl}
/// implementation of story apis
/// {@endtemplate}
class StoryApiImpl extends StoryApi {
  /// {@macro story_api_impl}
  const StoryApiImpl();

  /// convert jsonListData to List<UserStory> and return after 2 seconds as a Stream
  @override
  Stream<List<UserStory>> getStories() {
    return Stream.fromFuture(Future.delayed(const Duration(seconds: 2), () {
      return jsonListData.map((e) => UserStory.fromJson(e)).toList();
    }));
  }

  /// mark reel as viewed after 1 second
  @override
  Future<void> markReelAsViewed(String storyId, String reelId) {
    return Future.delayed(const Duration(seconds: 1));
  }
}
