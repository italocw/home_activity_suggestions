import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:home_activity_suggestions/features/suggestions/data/repositories/suggestion_repository_impl.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'suggestion_repository_implementation_test.mocks.dart';

@GenerateMocks([SuggestionDataSource, DocumentSnapshot<Object?>, DomainUser])
void main() {
  late MockSuggestionDataSource mockDatasource;
  late MockDomainUser mockDomainUser;
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
    mockDatasource = MockSuggestionDataSource();

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
mockDomainUser =  MockDomainUser();
    testDocumentList = [documentSnapshotMock];
  });

  group('Suggestion Repository Implementation tests', () {
/*
    test('Should return suggestions empty list', (() async {
      final suggestionRepository = SuggestionRepositoryImpl(mockDatasource, mockDomainUser)
      final SuggestionDataSource remoteDataSource =
      SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      remoteDataSource.snapshots.listen((event) {
        expect(event.docs, isEmpty);
      });
    }));





    test('Should retrieve non empty suggestions list', (() async {
      when(mockDatasource.getAllSuggestionDocuments())
          .thenAnswer((_) async => Future.value(testDocumentList));

      final expectedList = [testSuggestion];

      final repository =
          SuggestionRepositoryImpl(mockDatasource, testFirebaseAuth);

      final getAllResultValue =
          ((await repository.getAll()) as Success<List<Suggestion>>).value;

      expect(getAllResultValue.length, testDocumentList.length);

      getAllResultValue.asMap().forEach((index, currentResultSuggestion) {
        expect(currentResultSuggestion, equals(expectedList[index]));
      });
    }));

    test('Should retrieve  empty suggestions list', (() async {
      when(mockDatasource.getAllSuggestionDocuments())
          .thenAnswer((_) async => Future.value([]));

      final repository =
          SuggestionRepositoryImpl(mockDatasource, testFirebaseAuth);

      final getAllResultValue =
          ((await repository.getAll()) as Success<List<Suggestion>>).value;

      expect(getAllResultValue.isEmpty, true);
    }));

    test('Suggestion should be added', () async {
      final repository =
          SuggestionRepositoryImpl(mockDatasource, testFirebaseAuth);

      await repository.addSuggestion(testSuggestion);

      verify(mockDatasource.add(testSuggestionDataMap)).called(1);
    });

    test('Suggestion should be deleted', () async {
      final repository =
          SuggestionRepositoryImpl(mockDatasource, testFirebaseAuth);

      await repository.deleteSuggestion(testSuggestion.id!);

      verify(mockDatasource.delete(testSuggestion.id!)).called(1);
    });

    test('Suggestion should be updated', () async {
      final repository =
          SuggestionRepositoryImpl(mockDatasource, testFirebaseAuth);

      const updatedTitle = 'Updated title';

      var updatedSuggestion = testSuggestion;
      updatedSuggestion.title = updatedTitle;

      var updatedSuggestionMap = testSuggestionDataMap;
      updatedSuggestionMap['title'] = updatedTitle;

      await repository.updateSuggestion(updatedSuggestion);

      verify(mockDatasource.update(testSuggestion.id, updatedSuggestionMap))
          .called(1);
    });

    test('Suggestion related to the passed id should be returned', () async {
      final repository =
          SuggestionRepositoryImpl(mockDatasource, testFirebaseAuth);

      when(mockDatasource.getById(testSuggestionId))
          .thenAnswer((_) async => Future.value(documentSnapshotMock));

      final returnedSuggestion =
          await repository.getSuggestionById(testSuggestionId);

      expect(returnedSuggestion, equals(Success(testSuggestion)));
   });
*/  });
}
