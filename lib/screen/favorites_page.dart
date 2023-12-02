import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';

class FavoritePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    /// text usato per il titolo pagina
    final theme = Theme.of(context); 
    final TextStyle textStyle = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.secondary,
    );


    if (appState.favorites.isEmpty) {
      return SafeArea(
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
      );
    }

    return SafeArea(
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
                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text(pair.asLowerCase),
                    ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}