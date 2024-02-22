import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class DeleteSuggestion {
  final SuggestionRepository repository;

  DeleteSuggestion(this.repository);

  Future<void> call(String id) => throw Exception();
}
