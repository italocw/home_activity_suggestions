import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/data/data_providers.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion_stream.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/update_suggestion.dart';

final Provider<AddSuggestion> addSuggestionProvider = Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return AddSuggestion(suggestionRepository: repository);
    });

final Provider<UpdateSuggestion> updateSuggestionsProvider = Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return UpdateSuggestion(suggestionRepository: repository);
    });

final Provider<DeleteSuggestion>  deleteSuggestionProvider = Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return DeleteSuggestion(suggestionRepository: repository);
    });

final Provider<GetSuggestion>  getSuggestionProvider = Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return GetSuggestion(suggestionRepository: repository);
    });

final Provider<GetSuggestionStream>  getSuggestionsStreamProvider =
    Provider((ref) {
      final repository = ref.read(suggestionRepositoryProvider);
      return GetSuggestionStream(suggestionRepository: repository);
    });
