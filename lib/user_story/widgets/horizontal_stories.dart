import 'package:flutter/material.dart';
import 'package:story_api/story_api.dart';

import '../../../../common/data_state.dart';
import '../page/story_detail_page.dart';
import '../provider/user_stories_provider.dart';
import 'story_icon.dart';

class HorizontalStories extends StatelessWidget {
  const HorizontalStories({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = UserStoriesProvider.of(context);
    var state = provider.state;
    if (state.status != DataStatus.failure) {
      var data = state.data;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            data?.length ?? 0,
            (index) {
              UserStory? e = data?[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(index == 0 ? 16 : 4, 8, 4, 4),
                child: GestureDetector(
                  onTap: () {
                    if (e != null) {
                      // remove all null items from data and assign in new list
                      List<UserStory> nonNullableList =
                          data?.where((element) => element != null).toList() as List<UserStory>;
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) => StoryDetailPage(userIndex: index, data: nonNullableList),
                        ),
                      )
                          .then((value) {
                        provider.notifyListeners();
                      });
                    }
                  },
                  behavior: HitTestBehavior.opaque,
                  child: StoryIcon(story: e, isLoading: state.status == DataStatus.initial),
                ),
              );
            },
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }
}
