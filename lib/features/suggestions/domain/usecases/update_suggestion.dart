import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class UpdateSuggestion {
  final SuggestionRepository repository;

  UpdateSuggestion(this.repository);

  Future<void> call(Suggestion suggestion) =>
      repository.updateSuggestion(suggestion);
}
