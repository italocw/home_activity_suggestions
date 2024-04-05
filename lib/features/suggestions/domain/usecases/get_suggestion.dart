import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class GetSuggestion {
  final SuggestionRepository repository;

  GetSuggestion(this.repository);

  Future<Result<Suggestion>> call(String id) =>
      repository.getSuggestionById(id);
}
