import 'package:cloud_firestore/cloud_firestore.dart';

String fromDocumentToList(DocumentSnapshot snapshot) {
  return snapshot.data()['iconURL'] as String;
}
