import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_assignment/l10n/l10n.dart';

import '../home/page/home_page.dart';
import '../user_story/provider/user_stories_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserStoriesProvider(),
      child: MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            useMaterial3: true,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomePage()),
    );
  }
}
