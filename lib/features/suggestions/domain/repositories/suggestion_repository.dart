import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';

abstract class SuggestionRepository {
  Stream<QuerySnapshot<Object?>> get snapshots;
  Future<Result<List<Suggestion>>> getAll();
  Future<void> addSuggestion(Suggestion suggestion);
  Future<void> updateSuggestion(Suggestion suggestion);
  Future<void> deleteSuggestion(String id);
  Future<Result<Suggestion>> getSuggestionById(String id);
}
