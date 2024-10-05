import 'dart:async';
import 'dart:developer';

import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:home_activity_suggestions/features/suggestions/data/suggestion_map_keys.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

import '../../domain/suggestion_converter.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionDataSource _dataSource;
  final DomainUser _currentUser;
  final SuggestionConverter _suggestionConverter;

  SuggestionRepositoryImpl(
      {required SuggestionDataSource dataSource,
      required DomainUser currentUser,
      required SuggestionConverter suggestionConverter})
      : _dataSource = dataSource,
        _currentUser = currentUser,
        _suggestionConverter = suggestionConverter;

  @override
  Stream<List<Suggestion>> getSuggestionsByCategory(
      {required String categoryId}) {
    log("Entrou na get suggestions com category id = $categoryId");

    return _dataSource
        .getSnapshotsByCategory(categoryId: categoryId)
        .map((snapshot) {
      return snapshot.docs
          .map((documentSnapshot) =>
              _suggestionConverter.fromDocumentSnapshot(documentSnapshot))
          .toList();
    });
  }

  @override
  void addSuggestion(Suggestion suggestion) async {
    final suggestionMap = _suggestionMapWithUId(suggestion);
    _dataSource.add(suggestionMap);
  }

  get _currentUserID => _currentUser.id;

  Map<String, dynamic> _suggestionMapWithUId(Suggestion suggestion) {
    var suggestionMap = _suggestionConverter.toMap(suggestion);
    suggestionMap[SuggestionMapKeys.uid] = _currentUserID;
    return suggestionMap;
  }

  @override
  void deleteSuggestion(String id) async => await _dataSource.delete(id);

  @override
  void updateSuggestion(Suggestion suggestion) async {
    final suggestionMap = _suggestionMapWithUId(suggestion);
    await _dataSource.update(_currentUserID, suggestionMap);
  }

  @override
  Future<Result<Suggestion>> getSuggestionById(String id) async {
    try {
      final foundSuggestionMap = await _dataSource.getById(id);
      final suggestion =
          _suggestionConverter.fromDocumentSnapshot(foundSuggestionMap);

      return Success(suggestion);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
