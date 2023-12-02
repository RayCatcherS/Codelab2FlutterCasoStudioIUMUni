import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Avere widget separati per parti logiche separate della tua interfaccia
    // utente è un modo importante per gestire la complessità in Flutter.
    MyAppState appState = context.watch<MyAppState>();
    // dichiaro qui sopra l'oggetto che mi serve senza portare dietro per tutto 
    // il widget l'intero appState
    WordPair pair = appState.current; 


    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// creare un nuovo widget partendo da una cascata di Widget(Refactor)
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair, // named parameter (vs positional parameter)
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 

    final TextStyle textStyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(pair.asLowerCase, style: textStyle),
        ),
      ),
    );
  }
}