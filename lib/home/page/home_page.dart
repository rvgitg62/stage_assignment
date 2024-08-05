import 'package:flutter/material.dart';

import '../../user_story/widgets/horizontal_stories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizontalStories(),
        ],
      ),
    );
  }
}
