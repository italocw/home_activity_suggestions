import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/get_suggestion_stream.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/update_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/usecases_providers.dart';

final  suggestionsProvider = Provider((ref) {
      final addSuggestion = ref.read(addSuggestionProvider);
      final deleteSuggestion = ref.read(deleteSuggestionProvider);
      final updateSuggestion = ref.read(updateSuggestionsProvider);
      final snapshots = ref.watch(getSuggestionsStreamProvider);

      return SuggestionListNotifier(
          addSuggestion, updateSuggestion, deleteSuggestion, snapshots);
    });

class SuggestionListNotifier extends StateNotifier<List<Suggestion>> {
  SuggestionListNotifier(this._addSuggestion, this._updateSuggestion,
      this._deleteSuggestion, this._getSuggestionStream)
      : super([]);

  final AddSuggestion _addSuggestion;
  final DeleteSuggestion _deleteSuggestion;
  final UpdateSuggestion _updateSuggestion;
  final GetSuggestionStream _getSuggestionStream;

  Future<void> addSuggestion(Suggestion suggestion) async =>
      _addSuggestion(suggestion);

  Stream<Suggestion> getSuggestionsStream() => _getSuggestionStream();

  Future<void> updateSuggestion(Suggestion suggestion) async =>
      _updateSuggestion(suggestion);

  Future<void> deleteSuggestion(String id) async => _deleteSuggestion(id);
}
