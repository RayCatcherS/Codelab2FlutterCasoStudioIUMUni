# Punto di partenza caso studio

## Secondo codelab

Il primo codelab è raggiungibile tramite questo [link](https://github.com/RayCatcherS/CodelabFlutterUni).

Il primo codelab sarà il punto di partenza per questo secondo codelab.
Questo repository contiene l'intero progetto di partenza Flutter per il caso di studio IUM. Oltre al progetto di partenza il repository contiene il codelab con la spiegazione di come sono state implementate le funzionalità di authentication e invio dei dati al server(Firestore).

# Lezione 2

## Creazione progetto Firebase

Prima di illustrare come implementare authentication e collegamento con i servizi Firestore(database), ho già creato un nuovo progetto sulla piattaforma cloud Firebase collegandolo al progetto di partenza per il caso di studio flutter. Partendo da [questo codelab Google](https://firebase.google.com/codelabs/firebase-get-to-know-flutter?hl=it#2).

## Configurazione nel progetto Flutter

Anche qui la fonte per configurare il progetto Firebase con sul progetto Flutter è disponibile a [questo link](https://firebase.google.com/codelabs/firebase-get-to-know-flutter?hl=it#3), e l'ho già fatto per voi.

## Configura app Flutter

Per avviare i servizi Firebase sull'app flutter è stato seguito questo passaggio del codelab, che ho già fatto per voi, potete vederlo da [qui](https://firebase.google.com/codelabs/firebase-auth-in-flutter-apps?hl=it#2)



## Aggiungiamo il flusso di autenticazione

Dopo aver configurato il progetto flutter con il progetto Firebase, iniziamo implementando il flusso di autenticazione sulla nostra app Flutter.
L'autenticazione servirà ad essere riconosciuti da Firebase e ad accedere ai suoi servizi(tra cui database Firestore).

#### Pagina iniziale per l'autenticazione

Per iniziare, aggiungiamo una pagina per l'autenticazione chiamata `Authgate`. Prima di poter visualizzare una schermata di accesso, è necessario verificare se l'utente è attualmente autenticato. Il modo più comune per verificarlo è ascoltare authStateChanges di FirebaseAuth utilizzando il [plug-in Firebase Auth](https://firebase.google.com/docs/auth/flutter/start?hl=it#authstatechanges) .

Nel widget `Authgate` viene utilizzata una pagina gia pronta chiamata SignScreen, che utilizza un app state già pronto chiamato `EmailAuthProvider()`. Solitamente queste parti di codice sulla gestione degli input e degli stati di autenticazione li ho sempre scritti tutti a mano, ma Flutter ad oggi ci fornisce degli strumenti pronti e veloci che per questa lezione sono perfetti.

##### Personalizzare tema

Per personalizzare lo stile delle textbox basta andare nel file `main.dart` e personalizzare i parametri del tema da qui:

```dart
//...

inputDecorationTheme: InputDecorationTheme(
  // Personalizza i tuoi attributi di decorazione della casella di testo qui
  labelStyle: TextStyle(color: Colors.blue), // Colore del testo dell'etichetta
  fillColor: Colors.grey[200], // Colore di sfondo della casella di testo
  filled: true, // Per riempire o meno la casella di testo con il colore di sfondo
  border: OutlineInputBorder( // Personalizza i bordi
    borderRadius: BorderRadius.circular(10.0),
  ),
),

//...
```



## Configurare regole database Firestore

- **Imposto Regola Firestore:** Nella sezione Rules nella pagina del gestione progetto firestore imposto le regole per accedere al database. Imposterò un vincolo sulla possibilità di scrivere e leggere i dati all'interno del database solo se l'utente che fa la richiesta è autenticato. Si può accedere attraverso l'interfaccia web del progetto in: Firestore Database -> Regole. Imposto quindi la regola:
  
  
  ```dart
  rules_version = '2';
  // Allow read/write access on all documents to any user signed in to the application
  service cloud.firestore {
    match /databases/{database}/documents {
      match /{document=**} {
        allow read, write: if request.auth != null;
      }
    }
  }
  
  
  ```

- Visualizziamo la struttura del database dalla pagina dall'interfaccia web di Firebase. La struttura del database Firestore è **Raccolta** --> **Documenti**, a sua volta ogni documento può avere un'altra raccolta con all'interno ancora dei documenti e così via. Visualizzare esempio ***città***.

## Implementare query con server Firestore

Nella cartella `utils` del progetto ho inserito il file `firestore_database.dart` in cui implemento i metodi statici per ottenere e inviare le query al server.

- `getWordPair()` ottieni con una semplice query il documento con tutte le wordpair memorizzate nel server Firebase
  
  
  ```dart
  //...
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
  //...
  ```
  
  
  

## Gestire stato dell'app

- All'interno dello stato della nostra app `MyAppState` scriviamo un metodo per inizializzare le wordpair ottenute dal server firebase chiamato `initWordPairs`

- `isWordpairInitialized` Servirà a far visualizzare un caricamento se sarà false, altrimenti se sarà true la lista di word pair sarà pronta per essere visualizzata.

- `notifyListeners();` andrà a notificare il widget che osserva sullo stato dell'operazione

```dart
bool isWordpairRetrieved = false; // le word pair sono cariche

Future<void> retrieveWordPairs() async {
  isWordpairInitialized = false;
  notifyListeners();
  favorites = await FirestoreDatabase.getWordPair();
  isWordpairInitialized = true;
  notifyListeners();
}
```

- chiamiamo questo metodo nel costruttore del `MyAppState` (lo stato della nostra app per inizializzare lo stato), in modo da chiamarlo all'avvio dell'app ed avere le nostre parole caricate dal server firestore.

```dart
MyAppState() {
  // Chiamare initWordPairs nel costruttore
  retrieveWordPairs();
}
```
