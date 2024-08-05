import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:stage_assignment/home/page/home_page.dart';
import 'package:stage_assignment/user_story/provider/user_stories_provider.dart';
import 'package:stage_assignment/user_story/widgets/story_icon.dart';
import 'package:story_repository/story_repository.dart';

import '../../helpers/helpers.dart';
import '../apis/mock_story_api_impl.dart';

class MockStoryRepository extends Mock implements StoryRepository {}

void main() {
  group('StoryIcon List Test', () {
    late StoryRepository mockStoryRepository;

    setUp(() {
      mockStoryRepository = StoryRepository(storyApi: MockStoryApiImpl());
    });

    testWidgets('First item in the horizontal list contains a StoryIcon with avatar and valid name',
        (WidgetTester tester) async {
      // Build the widget tree with the mocked repository
      await tester.pumpApp(
        ChangeNotifierProvider<UserStoriesProvider>(
          create: (_) => UserStoriesProvider(repository: mockStoryRepository),
          child: HomePage(), // Your app widget
        ),
      );

      // Wait for the widget tree to stabilize
      await tester.pumpAndSettle();

      // Verify the first item in the list contains the expected StoryIcon
      expect(find.byType(StoryIcon), findsNWidgets(2));
      final firstStoryIcon = find.widgetWithText(StoryIcon, 'Stage User');
      expect(firstStoryIcon, findsOneWidget);
      expect(find.descendant(of: firstStoryIcon, matching: find.byType(CachedNetworkImage)), findsOneWidget);
    });
  });
}
