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



## Aggiungiamo il flusso di autenticazione

Dopo aver configurato il progetto flutter con il progetto Firebase, iniziamo implementando il flusso di autenticazione sulla nostra app Flutter.
L'autenticazione servirà ad essere riconosciuti da Firebase e ad accedere ai suoi servizi(tra cui database Firestore). 
