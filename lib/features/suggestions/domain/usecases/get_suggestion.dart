import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class GetSuggestion {
  final SuggestionRepository repository;

  GetSuggestion(this.repository);

  Future<Result<Suggestion>> call(String id) => throw Exception();
}
