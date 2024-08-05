import 'package:flutter_test/flutter_test.dart';
import 'package:story_repository/story_repository.dart';

class MockStoryApiImpl extends StoryApi {
  Stream<List<UserStory>> getStories() {
    return Stream.value([
      UserStory(
        id: '1',
        reels: [
          Reel(
            id: '1',
            mediaType: MediaType.image,
            mediaUrl: 'https://example.com/reel1.jpg',
          ),
        ],
        user: User(
          id: '1',
          name: 'Stage User',
          profilePicture: 'https://example.com/user1.jpg',
        ),
      ),
      UserStory(
        id: '2',
        reels: [
          Reel(
            id: '1',
            mediaType: MediaType.image,
            mediaUrl: 'https://example.com/reel2.jpg',
          ),
        ],
        user: User(
          id: '2',
          name: 'Stage User 2',
          profilePicture: 'https://example.com/user2.jpg',
        ),
      ),
    ]);
  }

  Future<void> markReelAsViewed(String storyId, String reelId) {
    return Future.value();
  }
}
