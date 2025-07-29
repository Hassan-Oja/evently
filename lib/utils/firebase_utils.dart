import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/event.dart';

class FirebaseUtils{
  static CollectionReference<Event> getEventCollection(){
     return FirebaseFirestore.instance.collection(Event.collectionName).withConverter(
      fromFirestore: (snapshot, options) => Event.fromjson(snapshot.data()!),
      toFirestore: (Event, options) => Event.tojson(),
    );
  }
  static Future<void> addEventToFireStore(Event event){
    // create collection
    CollectionReference<Event> collectionReference = getEventCollection();
    // create document
    DocumentReference<Event> documentReference = collectionReference.doc();
    // assign auto document id to event id
    event.eventID = documentReference.id ;
    return documentReference.set(event) ;
  }
}