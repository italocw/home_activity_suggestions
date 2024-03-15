import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:home_activity_sugestions/features/suggestions/data/repositories/suggestion_repository_impl.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/category.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

//@GenerateMocks([SuggestionDataSource, DocumentSnapshot<Object?>])
void main() {
/*  late MockSuggestionDataSource datasourceMock;
  late Map<String, dynamic> testSuggestionDataMap;
  late Suggestion testSuggestion;
  late MockDocumentSnapshot documentSnapshotMock;
  final Category testCategory =
      categories.firstWhere((category) => category.name == 'Books');
  late List<DocumentSnapshot<Object?>> testDocumentList;
  const testSuggestionId = 'id';
  const testUId = 'uid';
  final testFirebaseAuth =
      MockFirebaseAuth(signedIn: true, mockUser: MockUser(uid: testUId));

  setUp(() async {
    datasourceMock = MockSuggestionDataSource();

    testSuggestionDataMap = {
      'title': 'title',
      'description': 'description',
      'categoryId': testCategory.id,
      'uid': testUId
    };

    testSuggestion = Suggestion(
        id: 'id',
        title: 'title',
        description: 'description',
        category: testCategory);

    documentSnapshotMock = MockDocumentSnapshot();
    when(documentSnapshotMock.id).thenReturn(testSuggestionId);
    when(documentSnapshotMock.data()).thenReturn(testSuggestionDataMap);

    testDocumentList = [documentSnapshotMock];
  });

  group('Suggestion Repository Implementation tests', () {
    test('Should retrieve non empty suggestions list', (() async {
      when(datasourceMock.getAllSuggestionDocuments())
          .thenAnswer((_) async => Future.value(testDocumentList));

      final expectedList = [testSuggestion];

      final repository =
          SuggestionRepositoryImpl(datasourceMock, testFirebaseAuth);

      final getAllResultValue =
          ((await repository.getAll()) as Success<List<Suggestion>>).value;

      expect(getAllResultValue.length, testDocumentList.length);

      getAllResultValue.asMap().forEach((index, currentResultSuggestion) {
        expect(currentResultSuggestion, equals(expectedList[index]));
      });
    }));

    test('Should retrieve  empty suggestions list', (() async {
      when(datasourceMock.getAllSuggestionDocuments())
          .thenAnswer((_) async => Future.value([]));

      final repository =
          SuggestionRepositoryImpl(datasourceMock, testFirebaseAuth);

      final getAllResultValue =
          ((await repository.getAll()) as Success<List<Suggestion>>).value;

      expect(getAllResultValue.isEmpty, true);
    }));

    test('Suggestion should be added', () async {
      final repository =
          SuggestionRepositoryImpl(datasourceMock, testFirebaseAuth);

      await repository.addSuggestion(testSuggestion);

      verify(datasourceMock.add(testSuggestionDataMap)).called(1);
    });

    test('Suggestion should be deleted', () async {
      final repository =
          SuggestionRepositoryImpl(datasourceMock, testFirebaseAuth);

      await repository.deleteSuggestion(testSuggestion.id!);

      verify(datasourceMock.delete(testSuggestion.id!)).called(1);
    });

    test('Suggestion should be updated', () async {
      final repository =
          SuggestionRepositoryImpl(datasourceMock, testFirebaseAuth);

      const updatedTitle = 'Updated title';

      var updatedSuggestion = testSuggestion;
      updatedSuggestion.title = updatedTitle;

      var updatedSuggestionMap = testSuggestionDataMap;
      updatedSuggestionMap['title'] = updatedTitle;

      await repository.updateSuggestion(updatedSuggestion);

      verify(datasourceMock.update(testSuggestion.id, updatedSuggestionMap))
          .called(1);
    });

    test('Suggestion related to the passed id should be returned', () async {
      final repository =
          SuggestionRepositoryImpl(datasourceMock, testFirebaseAuth);

      when(datasourceMock.getById(testSuggestionId))
          .thenAnswer((_) async => Future.value(documentSnapshotMock));

      final returnedSuggestion =
          await repository.getSuggestionById(testSuggestionId);

      expect(returnedSuggestion, equals(Success(testSuggestion)));
    });
  }); */
}
