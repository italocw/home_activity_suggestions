import 'package:cloud_firestore/cloud_firestore.dart';

class SuggestionDataSource {
  final FirebaseFirestore firebaseFirestore;
  SuggestionDataSource({required this.firebaseFirestore});

  Stream<QuerySnapshot<Object?>> get snapshots => _collection.snapshots();

  CollectionReference get _collection =>
      firebaseFirestore.collection('suggestions');

  Future<DocumentReference<Object?>> add(Map<String, dynamic> suggestion) async =>
      await _collection.add(suggestion);

  Future<DocumentSnapshot<Object?>> getById(String id) async =>
      await _collection.doc(id).get();

  Future<void> update(
          String documentPath, Map<String, dynamic> updatedData) async =>
      await _collection.doc(documentPath).update(updatedData);

  Future<void> delete(String id) async => await _collection.doc(id).delete();
}
