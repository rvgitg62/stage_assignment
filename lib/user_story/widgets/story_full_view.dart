import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/reel_timeout_provider.dart';
import '../provider/reels_provider.dart';
import 'reel_view.dart';

class StoryFullView extends StatefulWidget {
  final int initialStoryIndex;

  const StoryFullView({super.key, required this.initialStoryIndex});

  @override
  _StoryFullViewState createState() => _StoryFullViewState();
}

class _StoryFullViewState extends State<StoryFullView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialStoryIndex);
  }

  @override
  void dispose() {
    // _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ReelsProvider provider = ReelsProvider.of(context);
    final length = provider.stories.length;
    return ChangeNotifierProvider(
      create: (_) => ReelTimeoutProvider(() {
        var currentStory = provider.getCurrentStory();
        provider.markReelAsViewed(provider.getCurrentReel(currentStory));
        var isLoaded = provider.loadNextReel(currentStory);
        if (!isLoaded) {
          _loadNext(provider, length, context);
        }
      }),
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          provider.loadStory(index);
        },
        itemCount: length,
        itemBuilder: (context, index) {
          return ReelView(
            onNext: () {
              _loadNext(provider, length, context);
            },
            onPrevious: () {
              _loadPrevious(provider, context);
            },
          );
        },
      ),
    );
  }

  void _loadPrevious(ReelsProvider provider, BuildContext context) {
    if (provider.currentUserIndex - 1 < 0) {
      Navigator.of(context).pop();
    } else {
      _pageController.animateToPage(
        provider.currentUserIndex - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _loadNext(ReelsProvider provider, int length, BuildContext context) {
    if (provider.currentUserIndex + 1 >= length) {
      Navigator.of(context).pop();
    } else {
      _pageController.animateToPage(
        provider.currentUserIndex + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
