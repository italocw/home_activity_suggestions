import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_remote_datasource.dart';
import 'package:home_activity_sugestions/features/suggestions/data/repositories/suggestion_repository_impl.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/category.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'suggestion_repository_implementation_test.mocks.dart';

@GenerateMocks([SuggestionRemoteDataSource, DocumentSnapshot<Object?>])
void main() {
  late MockSuggestionRemoteDataSource remoteDataSourceMock;
  late Map<String, dynamic> suggestionDataMap;
  late Suggestion suggestion;
  late MockDocumentSnapshot documentSnapshotMock;
  final Category books =
      categories.firstWhere((category) => category.name == 'Books');
  late List<DocumentSnapshot<Object?>> documentList;
  final suggestionId = 'id';

  setUp(() async {
    remoteDataSourceMock = MockSuggestionRemoteDataSource();

    suggestionDataMap = {
      'title': 'title',
      'description': 'description',
      'categoryId': books.id
    };

    suggestion = Suggestion(
        id: 'id', title: 'title', description: 'description', category: books);

    documentSnapshotMock = MockDocumentSnapshot();
    when(documentSnapshotMock.id).thenAnswer((_) => suggestionId);
    when(documentSnapshotMock.data()).thenAnswer((_) => suggestionDataMap);

    documentList = [documentSnapshotMock];
  });

  group('Suggestion Repository Implementation tests', () {
    test('Should return suggestions list', (() async {
      when(remoteDataSourceMock.getAllSuggestionDocuments())
          .thenAnswer((_) async => Future.value(documentList));

      final expectedList = [suggestion];

      final repository =
          SuggestionRepositoryImpl(remoteDataSource: remoteDataSourceMock);

      final getAllResultValue =
          ((await repository.getAll()) as Success<List<Suggestion>>).value;

      expect(getAllResultValue.length, documentList.length);

      getAllResultValue.asMap().forEach((index, currentResultSuggestion) {
        expect(currentResultSuggestion, equals(expectedList[index]));
      });
    }));

    test('Suggestion should be added', () async {
      final repository =
          SuggestionRepositoryImpl(remoteDataSource: remoteDataSourceMock);

      when(remoteDataSourceMock.add(any))
          .thenAnswer((_) async => Future<void>.value());
      repository.addSuggestion(suggestion);

      verify(remoteDataSourceMock.add(suggestionDataMap));
    });

    test('Suggestion should be deleted', () async {
      final repository =
          SuggestionRepositoryImpl(remoteDataSource: remoteDataSourceMock);

      when(remoteDataSourceMock.delete(any))
          .thenAnswer((_) async => Future<void>.value());
      repository.deleteSuggestion(suggestion.id!);

      verify(remoteDataSourceMock.delete(suggestion.id!));
    });

    test('Suggestion should be updated', () async {
      final repository =
          SuggestionRepositoryImpl(remoteDataSource: remoteDataSourceMock);

      const updatedTitle = 'Updated title';

      var updatedSuggestion = suggestion;
      updatedSuggestion.title = updatedTitle;

      var updatedSuggestionMap = suggestionDataMap;
      updatedSuggestionMap['title'] = updatedTitle;

      when(remoteDataSourceMock.update(any, any))
          .thenAnswer((_) async => Future<void>.value());

      repository.updateSuggestion(updatedSuggestion);

      verify(remoteDataSourceMock.update(suggestion.id, updatedSuggestionMap));
    });

    test('Suggestion related to the passed id should be returned', () async {
      final repository =
          SuggestionRepositoryImpl(remoteDataSource: remoteDataSourceMock);

      when(remoteDataSourceMock.getById(suggestionId))
          .thenAnswer((_) async => Future.value(documentSnapshotMock));

      final returnedSuggestion =
          await repository.getSuggestionById(suggestionId);

      expect(returnedSuggestion, equals(Success(suggestion)));
    });
  });
}
