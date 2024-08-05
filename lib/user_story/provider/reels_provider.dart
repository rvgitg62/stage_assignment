import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_api/story_api.dart';

class ReelsProvider extends ChangeNotifier {
  Future<Null>? timerFuture;

  static ReelsProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<ReelsProvider>(context, listen: listen);
  }

  int currentUserIndex;
  int currentReelIndex;

  final List<UserStory> stories;

  ReelsProvider({
    required this.currentUserIndex,
    required this.currentReelIndex,
    required this.stories,
  }) {
    // _startTimer();
  }

  // void _startTimer() {
  //   timerFuture = Future.delayed(Duration(seconds: 5), () {
  //     if (loadNextReel(isManual: false)) {
  //       _startTimer();
  //     }
  //   });
  // }

  bool loadNextUserStory() {
    if (currentUserIndex + 1 < stories.length) {
      currentUserIndex++;
      currentReelIndex = 0;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool loadPreviousUserStory() {
    if (currentUserIndex - 1 >= 0) {
      currentUserIndex--;
      currentReelIndex = 0;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool loadNextReel(UserStory currentStory, {bool isManual = true}) {
    int reelsLength = currentStory.reels!.length;
    if (currentReelIndex + 1 < reelsLength) {
      this.currentReelIndex++;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool loadPreviousReel(UserStory currentStory, {bool isManual = true}) {
    int currentReelIndex = this.currentReelIndex;
    if (currentReelIndex - 1 >= 0) {
      this.currentReelIndex--;
      notifyListeners();
      return true;
    }
    return false;
  }

  Reel getCurrentReel(UserStory currentStory) {
    return currentStory.reels![currentReelIndex];
  }

  bool isAllRealViewed(String storyId) {
    UserStory story = stories.firstWhere((element) => element.id == storyId);
    return story.reels!.every((element) => element.isViewed);
  }

  void markReelAsViewed(Reel reel) {
    reel.isViewed = true;
    notifyListeners();
  }

  UserStory getCurrentStory() {
    return stories[currentUserIndex];
  }

  void loadStory(int index) {
    currentUserIndex = index;
    currentReelIndex = 0;
    notifyListeners();
  }
}
