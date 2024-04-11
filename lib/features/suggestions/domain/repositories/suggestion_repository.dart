import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';

abstract class SuggestionRepository {
  List<Suggestion>   getSuggestionsByCategory({required String categoryId});

  Future<void> addSuggestion(Suggestion suggestion);

  Future<void> updateSuggestion(Suggestion suggestion);

  Future<void> deleteSuggestion(String id);

  Future<Result<Suggestion>> getSuggestionById(String id);
}
