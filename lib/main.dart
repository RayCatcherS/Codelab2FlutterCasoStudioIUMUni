import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'providers/app_providers.dart';
import 'widgets/auth_gate.dart';

Future<void> main() async {
  

  /// indica a Flutter di non avviare l'esecuzione del codice del widget 
  /// dell'applicazione fino al completo avvio del framework Flutter. 
  /// Firebase utilizza i canali della piattaforma nativa, che richiedono 
  /// l'esecuzione del framework.
  WidgetsFlutterBinding.ensureInitialized();

  /// configura una connessione tra la tua app Flutter e il tuo 
  /// progetto Firebase. DefaultFirebaseOptions.currentPlatform viene 
  /// importato dal nostro file firebase_options.dart. 
  /// Questo valore statico rileva su quale piattaforma sei in 
  /// esecuzione e trasmette le chiavi Firebase corrispondenti.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Avvio della nostra app
  runApp(
    MultiProvider(
      providers: AppProvider.getAppStates(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        inputDecorationTheme: InputDecorationTheme(
          // Personalizza i tuoi attributi di decorazione della casella di testo qui
          labelStyle: TextStyle(color: Colors.blue), // Colore del testo dell'etichetta
          fillColor: Colors.grey[200], // Colore di sfondo della casella di testo
          filled: true, // Per riempire o meno la casella di testo con il colore di sfondo
          border: OutlineInputBorder( // Personalizza i bordi
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      home: AuthGate(),
    );
  }
}




