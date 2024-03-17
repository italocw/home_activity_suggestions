import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/suggestions/data/data_providers.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/get_suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/get_suggestion_stream.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/usecases/update_suggestion.dart';

Provider<AddSuggestion> get addSuggestionProvider => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return AddSuggestion(repository);
    });

Provider<UpdateSuggestion> get updateSuggestionsProvider => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return UpdateSuggestion(repository);
    });

Provider<DeleteSuggestion> get deleteSuggestionProvider => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return DeleteSuggestion(repository);
    });

Provider<GetSuggestion> get getSuggestionProvider => Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return GetSuggestion(repository);
    });

Provider<GetSuggestionStream> get getSuggestionsStreamProvider =>
    Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return GetSuggestionStream(repository);
    });
