import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_remote_datasource.dart';
import 'package:home_activity_sugestions/features/suggestions/data/suggestion_mapper.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionDataSource _dataSource;
  final FirebaseAuth _firebaseAuth;

  SuggestionRepositoryImpl(this._dataSource, this._firebaseAuth);

  @override
  Stream<QuerySnapshot<Object?>> get snapshots => _dataSource.snapshots;

  @override
  Future<void> addSuggestion(Suggestion suggestion) async {
    final suggestionMap = _suggestionMapWithUId(suggestion);
    await _dataSource.add(suggestionMap);
  }

  get _currentUserID => _firebaseAuth.currentUser!.uid;

  Map<String, String> _suggestionMapWithUId(Suggestion suggestion) {
    var suggestionMap = suggestion.toMap();
    suggestionMap['uid'] = _currentUserID;
    return suggestionMap;
  }

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
  Future<void> updateSuggestion(Suggestion suggestion) async {
    final suggestionMap = _suggestionMapWithUId(suggestion);
    await _dataSource.update(suggestion.id!, suggestionMap);
  }

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
