import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/get_suggestions.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/update_suggestion.dart';

final suggestionsProvider = null;

class SuggestionNotifier extends StateNotifier<List<Suggestion>> {
  SuggestionNotifier(this._addSuggestion, this._updateSuggestion,
      this._deleteSuggestion, this._getSuggestions)
      : super([]);

  final AddSuggestion _addSuggestion;
  final DeleteSuggestion _deleteSuggestion;
  final UpdateSuggestion _updateSuggestion;
  final GetSuggestions _getSuggestions;

  void init() {}

  Future<void> addSuggestion(Suggestion suggestion) async {
    throw Exception();
  }

  Future<void> updateSuggestion(Suggestion suggestion) async {
    throw Exception();
  }

  Future<void> deleteSuggestion(String id) async {
    throw Exception();
  }
}
