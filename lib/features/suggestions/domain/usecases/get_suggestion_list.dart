import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class GetSuggestionList {
  final SuggestionRepository repository;

  GetSuggestionList(this.repository);

  Future<Result<List<Suggestion>>> call() => repository.getAll();
}
