import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/update_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/usecases_providers.dart';

final selectedSuggestionNotifierProvider =
    StateNotifierProvider<SelectedSuggestionNotifier, SuggestionCategory?>(
        (ref) {
  final deleteSuggestion = ref.read(deleteSuggestionProvider);
  final updateSuggestion = ref.read(updateSuggestionsProvider);
  return SelectedSuggestionNotifier(
      updateSuggestion: updateSuggestion, deleteSuggestion: deleteSuggestion);
});

class SelectedSuggestionNotifier extends StateNotifier<SuggestionCategory?> {
  SelectedSuggestionNotifier(
      {required UpdateSuggestion updateSuggestion,
      required DeleteSuggestion deleteSuggestion})
      : _updateSuggestion = updateSuggestion,
        _deleteSuggestion = deleteSuggestion,
        super(null);

  final DeleteSuggestion _deleteSuggestion;
  final UpdateSuggestion _updateSuggestion;

  Future<void> updateSuggestion(Suggestion suggestion) async =>
      _updateSuggestion(suggestion);

  Future<void> deleteSuggestion(String id) async => _deleteSuggestion(id);

  void select(SuggestionCategory suggestionSuggestion) =>
      state = suggestionSuggestion;
  void unselect() => state = null;

  SuggestionCategory? get suggestion => state;
}
