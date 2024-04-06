import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class GetSuggestionStream {
  final SuggestionRepository _repository;

  GetSuggestionStream({required SuggestionRepository suggestionRepository}) : _repository = suggestionRepository;


  Stream<List<Suggestion>> call() => _repository.getSuggestionsStream();
}
