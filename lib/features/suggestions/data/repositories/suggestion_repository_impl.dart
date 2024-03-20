import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_suggestions/core/result.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:home_activity_suggestions/features/suggestions/data/suggestion_mapper.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionDataSource _dataSource;
  final DomainUser _currentUser;

  SuggestionRepositoryImpl(this._dataSource, this._currentUser);

  @override
  Stream<Suggestion> getSuggestionsStream (){
    return _dataSource.snapshots.map((querySnapshot) {
      final List<Suggestion> suggestions = [];

      for (final doc in querySnapshot.docs) {
        final suggestion = doc.toSuggestion();
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
    var suggestionMap = suggestion.toMap();
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
      final foundSuggestionMap = (await _dataSource.getById(id));
      final suggestion = foundSuggestionMap.toSuggestion();

      return Success(suggestion);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
