import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class GetSuggestions {
  final SuggestionRepository repository;

  GetSuggestions(this.repository);

  Future<Result<List<Suggestion>>> call() => repository.getSuggestions();
}
