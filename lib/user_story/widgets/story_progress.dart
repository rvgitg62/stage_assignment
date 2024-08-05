import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_api/story_api.dart';

import '../provider/reel_timeout_provider.dart';

class StoryProgress extends StatelessWidget {
  final UserStory story;
  final int currentReelIndex;

  const StoryProgress(
    this.story, {
    required this.currentReelIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // render horizontal progress bar like whatsapp status or instagram story for list of reels
    var reels = story.reels;
    var totalReels = reels?.length;
    var viewedReels = reels?.where((element) => element.isViewed).length;
    if (totalReels == null || viewedReels == null) {
      return Container();
    }

    final width = MediaQuery.of(context).size.width / totalReels;

    return Row(
      children: List.generate(
        totalReels,
        (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Consumer<ReelTimeoutProvider>(
                builder: (context, provider, child) {
                  double progress =
                      provider.completedTimes / ReelTimeoutProvider.timeoutInMilliseconds.toDouble() * width;
                  return Stack(
                    children: [
                      Container(
                        height: 4,
                        color: Colors.grey,
                      ),
                      if (currentReelIndex == index)
                        Container(
                          height: 4,
                          width: progress,
                          color: Colors.blue,
                        ),
                      if (currentReelIndex > index)
                        Container(
                          height: 4,
                          width: width,
                          color: Colors.blue,
                        ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
