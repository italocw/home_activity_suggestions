import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class DeleteSuggestion {
  final SuggestionRepository repository;

  DeleteSuggestion(this.repository);

  Future<void> call(String id) => repository.deleteSuggestion(id);
}
