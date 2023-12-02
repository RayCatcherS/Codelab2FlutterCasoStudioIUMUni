import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';

class FavoritePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    
    final theme = Theme.of(context); 
    /// textStyle usato per il titolo pagina
    final TextStyle textStyle = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.secondary,
    );


    if (appState.favorites.isEmpty) {
      return Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Favorites Page", style: textStyle),
                Spacer(),
                Text('No favorites yet.'),
                Spacer()
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Favorites Page", style: textStyle),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('You have '
                          '${appState.favorites.length} favorites:'),
                    ),
                    for (var pair in appState.favorites)
                      FavoriteTile(key: UniqueKey(), pair: pair)
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class FavoriteTile extends StatelessWidget {
  const FavoriteTile({
    super.key,
    required this.pair
  });
  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListTile(
      leading: Icon(Icons.favorite),
      title: Text(pair.asLowerCase),
      trailing: ElevatedButton(
        child: Text("Remove"),
        onPressed: () {
          appState.removeFavorite(pair);
        },
      ),
    );
  }
}