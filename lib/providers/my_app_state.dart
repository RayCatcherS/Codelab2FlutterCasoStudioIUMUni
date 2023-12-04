import 'package:cloud_firestore/cloud_firestore.dart';
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

  TextEditingController TECName = TextEditingController();
  TextEditingController TECSurname = TextEditingController();
  TextEditingController TECEmail = TextEditingController();
  TextEditingController TECMessage = TextEditingController();

  Future<void> sendForm() async {
    Map<String, dynamic> json;

    json = {
      'name' : TECName.text,
      'surname' : TECSurname.text,
      'email' : TECEmail.text,
      'message' : TECMessage.text
    };

    await FirebaseFirestore.instance
    .collection('forms')
    .doc('iasdjuioadgfhbi')
    .set(json);
  }

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