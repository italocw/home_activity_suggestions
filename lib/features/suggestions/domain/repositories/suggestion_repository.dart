import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';

abstract class SuggestionRepository {
  Stream<List<Suggestion>> getSuggestionsByCategory(
      {required String categoryId});

  void addSuggestion(Suggestion suggestion);

  void updateSuggestion(Suggestion suggestion);

  void deleteSuggestion(String id);

  Future<Result<Suggestion>> getSuggestionById(String id);
}
