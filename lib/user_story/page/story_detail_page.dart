import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_api/story_api.dart';

import '../provider/reels_provider.dart';
import '../widgets/story_full_view.dart';

class StoryDetailPage extends StatelessWidget {
  final int userIndex;
  final List<UserStory> data;

  const StoryDetailPage({super.key, required this.userIndex, required this.data});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReelsProvider(
        currentUserIndex: userIndex,
        currentReelIndex: 0,
        stories: data,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Instagram'),
        ),
        body: StoryFullView(initialStoryIndex: userIndex),
      ),
    );
  }
}
