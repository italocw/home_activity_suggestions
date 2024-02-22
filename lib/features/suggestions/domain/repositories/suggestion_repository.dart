import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';

abstract class SuggestionRepository {
  Future<Result<List<Suggestion>>> getSuggestions();
  Future<void> addSuggestion(Suggestion suggestion);
  Future<void> updateSugestion(Suggestion suggestion);
  Future<void> deleteSuggestion(String id);
}
