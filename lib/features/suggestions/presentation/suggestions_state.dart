import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/get_suggestion_list.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/get_suggestion_stream_list.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/update_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/usecases_providers.dart';

get suggestionsProvider => Provider((ref) {
      final addSuggestion = ref.read(addSuggestionProvider);
      final deleteSuggestion = ref.read(deleteSuggestionProvider);
      final updateSuggestion = ref.read(updateSuggestionsProvider);
      final suggestionList = ref.read(getSuggestionListProvider);
      final snapshots = ref.read(getSnapshotProvider);

      return SuggestionNotifier(addSuggestion, deleteSuggestion,
          updateSuggestion, suggestionList, snapshots);
    });

class SuggestionNotifier extends StateNotifier<List<Suggestion>> {
  SuggestionNotifier(this._addSuggestion, this._updateSuggestion,
      this._deleteSuggestion, this._getSuggestions, this._getSuggestionStream)
      : super([]);

  final AddSuggestion _addSuggestion;
  final DeleteSuggestion _deleteSuggestion;
  final UpdateSuggestion _updateSuggestion;
  final GetSuggestionList _getSuggestions;
  final GetSuggestionStream _getSuggestionStream;

  Future<void> addSuggestion(Suggestion suggestion) async =>
      _addSuggestion(suggestion);

  Future<Result<List<Suggestion>>> getSuggestions() async => _getSuggestions();

  Stream<QuerySnapshot<Object?>> getSuggestionsSnapshot() =>
      _getSuggestionStream();

  Future<void> updateSuggestion(Suggestion suggestion) async =>
      _updateSuggestion(suggestion);

  Future<void> deleteSuggestion(String id) async => _deleteSuggestion(id);
}
