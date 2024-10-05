import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/usecases_providers.dart';

final addSuggestionStateProvider = Provider((ref) {
  final addSuggestion = ref.watch(addSuggestionProvider);
  return AddSuggestionState(addSuggestion: addSuggestion);
});

class AddSuggestionState {
  AddSuggestionState({required AddSuggestion addSuggestion})
      : _addSuggestion = addSuggestion;

  final AddSuggestion _addSuggestion;

  void addSuggestion({required Suggestion suggestion}) =>
      _addSuggestion(suggestion);
}
