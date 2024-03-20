import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class AddSuggestion {
  final SuggestionRepository repository;

  AddSuggestion(this.repository);

  Future<void> call(Suggestion suggestion) async =>
      await repository.addSuggestion(suggestion);
}
