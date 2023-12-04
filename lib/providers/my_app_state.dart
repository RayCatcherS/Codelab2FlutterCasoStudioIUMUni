import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/firestore_database.dart';

class MyAppState extends ChangeNotifier {
  MyAppState() {
    // Chiamare initWordPairs nel costruttore
    retrieveWordPairs();
  }
  final FirebaseAuth auth = FirebaseAuth.instance; // istanza autenticazione

  WordPair current = WordPair.random();
  List<WordPair> favorites = <WordPair>[];
  bool isWordpairRetrieved = false;

  

  Future<void> retrieveWordPairs() async {
    isWordpairRetrieved = false;
    notifyListeners();

    favorites = await FirestoreDatabase.getWordPair();

    isWordpairRetrieved = true;
    notifyListeners();
  }

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
  

  Future<void> toggleFavorite() async {
    if (favorites.contains(current)) {
      // remove favorite from server
      await removeFavorite(current);
    } else {
      isWordpairRetrieved = false;
      notifyListeners();

      await FirestoreDatabase.addWordPair(current);
      favorites = await FirestoreDatabase.getWordPair();

      isWordpairRetrieved = true;
      notifyListeners();
    }
  }

  Future<void> removeFavorite(WordPair pair) async {
    
    isWordpairRetrieved = false;
    notifyListeners();

    await FirestoreDatabase.removeWordPair(pair);
    favorites = await FirestoreDatabase.getWordPair();

    isWordpairRetrieved = true;
    notifyListeners();
  }

  Future<void> signoutFirebase() async {
    await auth.signOut();
  }
}