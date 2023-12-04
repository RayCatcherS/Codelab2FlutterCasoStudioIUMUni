import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';

class FirestoreDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<WordPair>> getWordPair() async {

    List<WordPair> wordPairs = [];

    DocumentSnapshot<Map<String, dynamic>> doc = 
    await FirebaseFirestore.instance
    .collection('documents')
    .doc('favorite')
    .get();

    // estrai i dati dall'oggetto doc
    List<dynamic> rawData = doc.data()!['items'];

    // costruiamo la lista di Wordpair a partire dai dati estratti dal doc 
    rawData.forEach((element) {
      WordPair wordPair = WordPair(
        element['first'], element['second']
      );
      wordPairs.add(wordPair);
    });

    return wordPairs;
  } 

  static Future<void> addWordPair(WordPair wordPair) async {
    await FirebaseFirestore.instance
    .collection('documents')
    .doc('favorite')
    .update({
      'items': FieldValue.arrayUnion([
        {'first' : wordPair.first,'second' : wordPair.second}
        ])
    });
  }

  static Future<void> removeWordPair(WordPair wordPair) async {
     
    await FirebaseFirestore.instance
    .collection('documents')
    .doc('favorite')
    .update({
      'items' : FieldValue.arrayRemove([
        {'first' : wordPair.first,'second' : wordPair.second}
      ])
    });

    print("remove pair");

    return;
  }
}