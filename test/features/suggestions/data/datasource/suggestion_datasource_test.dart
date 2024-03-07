import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_remote_datasource.dart';
import 'package:test/test.dart';

void main() {
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late Map<String, dynamic> testSuggestionData;
  late CollectionReference testCollection;

  setUp(() {
    testSuggestionData = {
      'title': 'title',
      'description': 'description',
      'categoryId': 'id'
    };

    fakeFirebaseFirestore = FakeFirebaseFirestore();
    testCollection = fakeFirebaseFirestore.collection('suggestions');
  });

  group('Data source tests', () {
    test('Should retrieve expected suggestion documents from snapshots',
        (() async {
      await testCollection.doc().set(testSuggestionData);
      final QuerySnapshot querySnapshot = await testCollection.get();
      final expectedResult = querySnapshot.docs;

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      remoteDataSource.snapshots.listen((event) {
        assertSuggestionDocumentListEquality(event.docs, expectedResult);
      });
    }));

    test('Should retrieve expected suggestion documents', (() async {
      await testCollection.doc().set(testSuggestionData);
      final QuerySnapshot querySnapshot = await testCollection.get();
      final expectedResult = querySnapshot.docs;

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      final getAllResult = await remoteDataSource.getAllSuggestionDocuments();

      assertSuggestionDocumentListEquality(getAllResult, expectedResult);
    }));

    test('Should return document suggestions empty list', (() async {
      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      final getAllResult = await remoteDataSource.getAllSuggestionDocuments();

      expect(getAllResult, isEmpty);
    }));

    test('Document suggestion should be added', (() async {
      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      await remoteDataSource.add(testSuggestionData);

      final getAllResult = await remoteDataSource.getAllSuggestionDocuments();

      assertReturnedSuggestionSingularityAndEquality(
          getAllResult, testSuggestionData);
    }));

    test('Document suggestion should be deleted', (() async {
      await testCollection.doc().set(testSuggestionData);
      final QuerySnapshot querySnapshot = await testCollection.get();
      final docId = querySnapshot.docs.first.id;

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      await remoteDataSource.delete(docId);
      final documentResult = await remoteDataSource.getById(docId);

      expect(documentResult.exists, false);
    }));

    test('Document suggestion should be updated', (() async {
      await testCollection.doc().set(testSuggestionData);
      final QuerySnapshot querySnapshot = await testCollection.get();
      final documentId = querySnapshot.docs.first.id;

      testSuggestionData['title'] = 'updatedTitle';

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      await remoteDataSource.update(documentId, testSuggestionData);
      final documentResult = await remoteDataSource.getById(documentId);

      expect(documentResult.data(), testSuggestionData);
    }));

    test('Suggestion should be retrived', (() async {
      await testCollection.doc().set(testSuggestionData);

      final QuerySnapshot querySnapshot = await testCollection.get();

      final docId = querySnapshot.docs.first.id;

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      final expectedDocumentData = testSuggestionData;
      final documentResult = await remoteDataSource.getById(docId);

      expect(documentResult.data(), expectedDocumentData);
    }));
  });
}

void assertSuggestionDocumentListEquality(
    List<DocumentSnapshot<Object?>> documentsResultsUnderTest,
    List<DocumentSnapshot<Object?>> expectedResult) {
  expect(documentsResultsUnderTest.length, equals(expectedResult.length));

  documentsResultsUnderTest.asMap().forEach((index, getAllDocument) {
    final expectedDocument = expectedResult[index];

    expect(getAllDocument.id, equals(expectedDocument.id));
    expect(getAllDocument.data(), equals(expectedDocument.data()));
  });
}

void assertReturnedSuggestionSingularityAndEquality(
    List<DocumentSnapshot<Object?>> documentsResultsUnderTest,
    Map<String, dynamic> suggestionMap) {
  expect(documentsResultsUnderTest.length, equals(1));

  final foundResult = documentsResultsUnderTest.first;
  expect(foundResult.data(), suggestionMap);
}
