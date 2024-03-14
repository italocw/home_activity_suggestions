import 'package:cloud_firestore/cloud_firestore.dart';

class SuggestionDataSource {
  final FirebaseFirestore firebaseFirestore;
  SuggestionDataSource({required this.firebaseFirestore}) {}

  Future<List<DocumentSnapshot<Object?>>> getAllSuggestionDocuments() async {
    final QuerySnapshot querySnapshot = await _collection.get();
    return querySnapshot.docs;
  }

  Stream<QuerySnapshot<Object?>> get snapshots => _collection.snapshots();

  CollectionReference get _collection =>
      firebaseFirestore.collection('suggestions');

  Future<void> add(Map<String, dynamic> suggestion) async =>
      await _collection.doc().set(suggestion);

  Future<DocumentSnapshot<Object?>> getById(String id) async =>
      await _collection.doc(id).get();

  Future<void> update(
          String documentId, Map<String, dynamic> updatedData) async =>
      await _collection.doc(documentId).update(updatedData);

  Future<void> delete(String id) async => await _collection.doc(id).delete();
}
