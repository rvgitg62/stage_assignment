import 'package:flutter/material.dart';
import 'package:story_api/story_api.dart';

import '../../widgets/avatar.dart';

class StoryIcon extends StatelessWidget {
  final UserStory? story;
  final bool isLoading;

  const StoryIcon({required this.story, super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    // render Avatar widget and username
    bool isAllReelViewed = story?.reels?.every((element) => element.isViewed) ?? false;

    return Column(
      children: [
        Hero(
          tag: '${story?.user.name}',
          child: Avatar(
              imageUrl: story?.user.profilePicture, radius: 40, isAllReelViewed: isAllReelViewed, isLoading: isLoading),
        ),
        Text(story?.user.name ?? ''),
      ],
    );
  }
}
