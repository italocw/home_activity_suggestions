import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_remote_datasource.dart';
import 'package:home_activity_sugestions/features/suggestions/data/suggestion_mapper.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionDataSource _dataSource;

  SuggestionRepositoryImpl({required SuggestionDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Stream<QuerySnapshot<Object?>> get snapshots => _dataSource.snapshots;

  @override
  Future<void> addSuggestion(Suggestion suggestion) async =>
      await _dataSource.add(suggestion.toMap());

  @override
  Future<void> deleteSuggestion(String id) async =>
      await _dataSource.delete(id);

  @override
  Future<Result<List<Suggestion>>> getAll() async {
    try {
      final documentSnapshots = await _dataSource.getAllSuggestionDocuments();
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
      await _dataSource.update(suggestion.id!, suggestion.toMap());

  @override
  Future<Result<Suggestion>> getSuggestionById(String id) async {
    try {
      final foundSuggestionMap = (await _dataSource.getById(id));
      final suggestion = SuggestionMapper.toSuggestion(foundSuggestionMap);

      return Success(suggestion);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
