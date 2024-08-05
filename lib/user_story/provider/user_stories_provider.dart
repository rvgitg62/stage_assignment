import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_api_impl/story_api_impl.dart';
import 'package:story_repository/story_repository.dart';

import '../../../common/data_state.dart';

class UserStoriesProvider extends ChangeNotifier {
  static UserStoriesProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<UserStoriesProvider>(context, listen: listen);
  }

  ListState<UserStory> state = ListState<UserStory>();

  final StoryRepository repository;

  UserStoriesProvider({this.repository = const StoryRepository(storyApi: const StoryApiImpl())}) {
    getStories();
  }

  void markReelAsViewed(String storyId, String reelId) {
    repository.markReelAsViewed(storyId, reelId).then((value) {
      var stories = state.data;
      stories = stories?.map((e) {
        if (e?.id == storyId) {
          e?.reels = e.reels?.map((r) {
            if (r.id == reelId) {
              r.isViewed = true;
            }
            return r;
          }).toList();
        }
        return e;
      }).toList();
      state = state.copyWith(data: stories);
      notifyListeners();
    });
  }

  getStories() {
    state = state.copyWith(status: DataStatus.initial, data: [null, null, null]);
    notifyListeners();

    repository.getStories().listen((event) {
      state = state.copyWith(status: DataStatus.success, data: event);
      print('get stories');
      notifyListeners();
    }, onError: (error) {
      state = state.copyWith(status: DataStatus.failure, errorMsg: error.toString());
      notifyListeners();
    });
  }
}
