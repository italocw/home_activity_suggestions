import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class DeleteSuggestion {
  final SuggestionRepository _repository;

  DeleteSuggestion({required SuggestionRepository suggestionRepository}) : _repository = suggestionRepository;
  Future<void> call(String id) => _repository.deleteSuggestion(id);
}
