import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/suggestions/data/data_providers.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/get_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/get_suggestion_list.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/update_suggestion.dart';

get getSuggestionListProvider => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return GetSuggestionList(repository);
    });
get addSuggestionProvider => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return AddSuggestion(repository);
    });
get updateSuggestionsProvider => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return UpdateSuggestion(repository);
    });
get deleteSuggestionProvider => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return DeleteSuggestion(repository);
    });
get getSuggestionProvider => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return GetSuggestion(repository);
    });
get getStreamList => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return GetSuggestionList(repository);
    });
