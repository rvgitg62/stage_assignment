// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:story_repository/story_repository.dart';

import 'test_story_api_impl.dart';

void main() {
  group('StoryRepository', () {
    test('can be instantiated', () {
      final storyApi = TestStoryApi();
      expect(StoryRepository(storyApi: storyApi), isNotNull);
    });

    test('getStories returns a Stream of List<UserStory>', () async {
      final storyApi = TestStoryApi();
      final storyRepository = StoryRepository(storyApi: storyApi);
      final stories = await storyRepository.getStories().first;
      expect(stories, isA<List<UserStory>>());
    });
    
    test('markReelAsViewed returns a Future', () async {
      final storyApi = TestStoryApi();
      final storyRepository = StoryRepository(storyApi: storyApi);
      final future = storyRepository.markReelAsViewed('storyId', 'reelId');
      expect(future, isA<Future>());
    });
  });
}