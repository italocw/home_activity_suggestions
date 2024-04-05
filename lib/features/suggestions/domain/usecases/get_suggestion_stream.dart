import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class GetSuggestionStream {
  final SuggestionRepository repository;

  GetSuggestionStream(this.repository);

  Stream<List<Suggestion>> call() => repository.getSuggestionsStream();
}
