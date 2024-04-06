import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class GetSuggestion {
  final SuggestionRepository _repository;

  GetSuggestion({required SuggestionRepository suggestionRepository}) : _repository = suggestionRepository;


  Future<Result<Suggestion>> call(String id) =>
      _repository.getSuggestionById(id);
}
