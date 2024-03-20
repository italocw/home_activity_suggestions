import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_suggestions/core/result.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';

abstract class SuggestionRepository {
  Stream<Suggestion> getSuggestionsStream();

  Future<void> addSuggestion(Suggestion suggestion);

  Future<void> updateSuggestion(Suggestion suggestion);

  Future<void> deleteSuggestion(String id);

  Future<Result<Suggestion>> getSuggestionById(String id);
}
