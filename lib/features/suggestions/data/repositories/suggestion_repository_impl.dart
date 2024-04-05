import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  late final StreamController<List<Suggestion>> _streamController;

  SuggestionRepositoryImpl(
      {required SuggestionDataSource dataSource,
      required DomainUser currentUser,
      required SuggestionConverter suggestionConverter})
      : _dataSource = dataSource,
        _currentUser = currentUser,
        _suggestionConverter = suggestionConverter {
    setSuggestionsStream();
  }

  void setSuggestionsStream() {
    _streamController = StreamController<List<Suggestion>>();

    _dataSource.snapshots.listen((snapshot) {
      List<Suggestion> suggestions = [];

      suggestions = snapshot.docs
          .map((documentSnapshot) =>
              _suggestionConverter.fromDocumentSnapshot(documentSnapshot))
          .toList();


      _streamController.add(suggestions);
      _streamController.close();
    });

  }

  @override
  Stream<List<Suggestion>> getSuggestionsStream() {
    return _streamController.stream;
  }

  @override
  Future<void> addSuggestion(Suggestion suggestion) async {
    final suggestionMap = _suggestionMapWithUId(suggestion);
    await _dataSource.add(suggestionMap);
  }

  get _currentUserID => _currentUser.id;

  Map<String, dynamic> _suggestionMapWithUId(Suggestion suggestion) {
    var suggestionMap = _suggestionConverter.toMap(suggestion);
    suggestionMap[SuggestionMapKeys.uid] = _currentUserID;
    return suggestionMap;
  }

  @override
  Future<void> deleteSuggestion(String id) async =>
      await _dataSource.delete(id);

  @override
  Future<void> updateSuggestion(Suggestion suggestion) async {
    final suggestionMap = _suggestionMapWithUId(suggestion);
    await _dataSource.update(suggestion.id!, suggestionMap);
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
