import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_api/story_api.dart';

import '../provider/reel_timeout_provider.dart';
import '../provider/reels_provider.dart';
import 'story_info.dart';
import 'story_progress.dart';

const placeholder = 'assets/images/placeholder.jpg';

class ReelView extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const ReelView({
    super.key,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    ReelsProvider provider = ReelsProvider.of(context);
    var story = provider.getCurrentStory();
    var reel = provider.getCurrentReel(story);
    int reelIndex = provider.currentReelIndex;

    Widget reelWidget = _buildReel(context, reel.mediaUrl);

    return Builder(builder: (context) {
      return Stack(
        children: [
          // render current reel
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: reelWidget,
            onTapUp: (details) {
              // mark reel as viewed if clicked on right side of screen
              double middlePoint = MediaQuery.of(context).size.width / 2;
              ReelTimeoutProvider timeoutProvider = ReelTimeoutProvider.of(context, listen: false);
              timeoutProvider.restartTimer();
              _loadReel(
                provider: provider,
                reel: reel,
                isNext: details.localPosition.dx > middlePoint,
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                StoryProgress(story, currentReelIndex: reelIndex),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: StoryInfo(story),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // render user avatar
          // render user name
        ],
      );
    });
  }

  _buildReel(BuildContext context, String? reelUrl) {
    if (reelUrl == null) {
      return _placeholder();
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).primaryColor.withAlpha(30),
      child: CachedNetworkImage(
        key: ValueKey(reelUrl),
        imageUrl: reelUrl,
        useOldImageOnUrlChange: true,
        fit: BoxFit.contain,
        placeholder: (context, url) {
          return _placeholder();
        },
        errorWidget: (BuildContext context, String url, dynamic error) {
          return _placeholder();
        },
      ),
    );
  }

  Widget _placeholder() {
    return Image.asset(placeholder, fit: BoxFit.contain);
  }

  void _loadReel({
    required ReelsProvider provider,
    required Reel reel,
    bool isNext = true,
  }) {
    provider.markReelAsViewed(reel);
    if (isNext) {
      var isLoaded = provider.loadNextReel(provider.getCurrentStory());
      if (!isLoaded) {
        onNext.call();
      }
    } else {
      var isLoaded = provider.loadPreviousReel(provider.getCurrentStory());
      if (!isLoaded) {
        onPrevious.call();
      }
    }
  }
}
