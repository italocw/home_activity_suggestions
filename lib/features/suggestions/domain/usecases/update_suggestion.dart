import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class UpdateSuggestion {
  final SuggestionRepository _repository;

  UpdateSuggestion({required SuggestionRepository suggestionRepository}) : _repository = suggestionRepository;

  Future<void> call(Suggestion suggestion) =>
      _repository.updateSuggestion(suggestion);
}
