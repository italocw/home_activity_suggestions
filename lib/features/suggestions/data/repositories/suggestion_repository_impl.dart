import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_remote_datasource.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionRemotelDataSource remoteDataSource;

  SuggestionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addSuggestion(Suggestion suggestion) async {
    throw Exception();
  }

  @override
  Future<void> deleteSuggestion(String id) async {
    throw Exception();
  }

  @override
  Future<Result<List<Suggestion>>> getSuggestions() async {
    throw Exception();
  }

  @override
  Future<void> updateSugestion(Suggestion suggestion) {
    throw Exception();
  }
}
