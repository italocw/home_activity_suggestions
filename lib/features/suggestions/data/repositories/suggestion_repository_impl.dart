import 'package:home_activity_suggestions/core/result.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/suggestions/data/datasource/suggestion_datasource.dart';
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
  Stream<Suggestion> getSuggestionsStream() {
    return _dataSource.snapshots.map((querySnapshot) {
      final List<Suggestion> suggestions = [];

      for (final doc in querySnapshot.docs) {
        final suggestion = _suggestionConverter.fromDocumentSnapshot(doc);
        suggestions.add(suggestion);
      }

      return suggestions;
    }).expand((suggestions) => suggestions);
  }

  @override
  Future<void> addSuggestion(Suggestion suggestion) async {
    final suggestionMap = _suggestionMapWithUId(suggestion);
    await _dataSource.add(suggestionMap);
  }

  get _currentUserID => _currentUser.id;

  Map<String, String> _suggestionMapWithUId(Suggestion suggestion) {
    var suggestionMap = _suggestionConverter.toMap(suggestion);
    suggestionMap['uid'] = _currentUserID;
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
      final suggestion = _suggestionConverter.fromDocumentSnapshot(foundSuggestionMap);

      return Success(suggestion);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
