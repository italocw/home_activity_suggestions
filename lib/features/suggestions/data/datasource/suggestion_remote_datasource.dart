import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';

class SuggestionRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  SuggestionRemoteDataSource({required this.firebaseFirestore});
  List<Suggestion> getAll() => throw Exception();

  add(Suggestion suggestion) {
    throw Exception();
  }

  update(Suggestion suggestion) {
    throw Exception();
  }

  delete(String id) {
    throw Exception();
  }
}
