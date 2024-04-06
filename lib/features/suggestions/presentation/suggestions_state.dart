import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion_stream.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/update_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/usecases_providers.dart';

import '../../../core/data/result.dart';

final suggestionsProvider = Provider((ref) {
  final addSuggestion = ref.read(addSuggestionProvider);
  final getSuggestion = ref.read(getSuggestionProvider);
  final deleteSuggestion = ref.read(deleteSuggestionProvider);
  final updateSuggestion = ref.read(updateSuggestionsProvider);
  final getSuggestionStream = ref.watch(getSuggestionsStreamProvider);

  return SuggestionListNotifier(
      addSuggestion: addSuggestion,
      getSuggestion: getSuggestion,
      updateSuggestion: updateSuggestion,
      deleteSuggestion: deleteSuggestion,
      getSuggestionStream: getSuggestionStream);
});

class SuggestionListNotifier extends StateNotifier<List<Suggestion>> {
  SuggestionListNotifier(
      {required AddSuggestion addSuggestion,
      required GetSuggestion getSuggestion,
      required UpdateSuggestion updateSuggestion,
      required DeleteSuggestion deleteSuggestion,
      required GetSuggestionStream getSuggestionStream})
      : _addSuggestion = addSuggestion,
        _getSuggestion = getSuggestion,
        _updateSuggestion = updateSuggestion,
        _deleteSuggestion = deleteSuggestion,
        _getSuggestionStream = getSuggestionStream,
        super([]);

  final AddSuggestion _addSuggestion;
  final GetSuggestion _getSuggestion;
  final UpdateSuggestion _updateSuggestion;
  final DeleteSuggestion _deleteSuggestion;
  final GetSuggestionStream _getSuggestionStream;

  Future<void> addSuggestion(Suggestion suggestion) async =>
      _addSuggestion(suggestion);

  Future<Result<Suggestion>> getSuggestion(String suggestionId) async =>
      _getSuggestion(suggestionId);

  Stream<List<Suggestion>> getSuggestionsStream() => _getSuggestionStream();

  Future<void> updateSuggestion(Suggestion suggestion) async =>
      _updateSuggestion(suggestion);

  Future<void> deleteSuggestion(String id) async => _deleteSuggestion(id);
}
