import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_remote_datasource.dart';
import 'package:home_activity_sugestions/features/suggestions/data/suggestion_mapper.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionRemoteDataSource remoteDataSource;

  SuggestionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addSuggestion(Suggestion suggestion) async =>
      await remoteDataSource.add(suggestion.toMap());

  @override
  Future<void> deleteSuggestion(String id) async =>
      await remoteDataSource.delete(id);

  @override
  Future<Result<List<Suggestion>>> getAll() async {
    try {
      final documentSnapshots =
          await remoteDataSource.getAllSuggestionDocuments();
      final suggestionList = documentSnapshots
          .map((document) => SuggestionMapper.toSuggestion(document))
          .toList();

      return Success(suggestionList);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }

  @override
  Future<void> updateSuggestion(Suggestion suggestion) async =>
      await remoteDataSource.update(suggestion.id!, suggestion.toMap());

  @override
  Future<Result<Suggestion>> getSuggestionById(String id) async {
    try {
      final foundSuggestionMap = (await remoteDataSource.getById(id));
      final suggestion = SuggestionMapper.toSuggestion(foundSuggestionMap);

      return Success(suggestion);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
