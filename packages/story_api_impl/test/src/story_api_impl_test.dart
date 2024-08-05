// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:story_api/story_api.dart';
import 'package:story_api_impl/story_api_impl.dart';

void main() {
  group('StoryApiImpl', () {
    test('can be instantiated', () {
      expect(StoryApiImpl(), isNotNull);
    });

    test('getStories returns a Stream of List<UserStory>', () async {
      final storyApi = StoryApiImpl();
      final stories = await storyApi.getStories().first;
      expect(stories, isA<List<UserStory>>());
    });

    test('markReelAsViewed returns a Future', () async {
      final storyApi = StoryApiImpl();
      final future = storyApi.markReelAsViewed('storyId', 'reelId');
      expect(future, isA<Future>());
    });
  });
}
