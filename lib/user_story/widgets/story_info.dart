import 'package:flutter/material.dart';
import 'package:story_api/story_api.dart';

import '../../widgets/avatar.dart';

class StoryInfo extends StatelessWidget {
  final UserStory story;

  const StoryInfo(this.story, {super.key});

  @override
  Widget build(BuildContext context) {
    final user = story.user;
    final String? avatarUrl = user.profilePicture;
    final String userName = user.name;

    // render avatar of 20 radius followed by user name in horizontal bar
    return Row(
      children: [
        Hero(
          tag: '${story.user.name}',
          child: Avatar(imageUrl: avatarUrl, radius: 20),
        ),
        SizedBox(width: 8),
        Text(userName, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
