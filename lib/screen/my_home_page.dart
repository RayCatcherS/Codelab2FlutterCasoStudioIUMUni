import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_app_state.dart';



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Avere widget separati per parti logiche separate della tua interfaccia
    // utente è un modo importante per gestire la complessità in Flutter.
    MyAppState appState = context.watch<MyAppState>();
    // dichiaro qui l'oggetto che mi serve(pair) senza portare dietro per tutto 
    // il widget l'intero appState(appState.current)
    WordPair pair = appState.current; 



    /// text usato per il titolo pagina
    final theme = Theme.of(context); 
    final TextStyle textStyle = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.secondary,
    );

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
       /// SafeArea fa in modo che l'area di visualizzazione si restringa
       /// in uno spazio tale che non entri in conflitto con la barra delle
       /// notifiche, dei notch o degli stondamenti dei display
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("My Home Page", style: textStyle,),
              Spacer(),
              BigCard(pair: pair),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    
                    onPressed: appState.isWordpairRetrieved ?() {
                      appState.toggleFavorite();
                    } : null,
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
              Spacer(),
            ],
          ),
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          child: Wrap(
            children: [
              Text(
                pair.first,
                style: textStyle.copyWith(fontWeight: FontWeight.w200),
              ),
              Text(
                pair.second,
                style: textStyle.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          )
        ),
      ),
    );
  }
}