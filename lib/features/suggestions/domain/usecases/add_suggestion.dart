import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class AddSuggestion {
  final SuggestionRepository _repository;

  AddSuggestion({required SuggestionRepository suggestionRepository}):_repository = suggestionRepository;

  Future<void> call(Suggestion suggestion) async =>
      await _repository.addSuggestion(suggestion);
}
