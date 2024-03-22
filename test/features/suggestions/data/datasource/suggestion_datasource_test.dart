import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:home_activity_suggestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:mockito/mockito.dart';
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
    test('Should return document suggestions empty list', (() async {
      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      remoteDataSource.snapshots.listen((event) {
        expect(event.docs, isEmpty);
      });
    }));

    test('Should return document suggestions non empty list', (() async {
      await testCollection.doc().set(testSuggestionData);

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      final expectedQuerySnapshot = await testCollection.get();

      remoteDataSource.snapshots.listen((resultQuerySnapshot) {
        assertSnapshotsEquality(resultQuerySnapshot, expectedQuerySnapshot);
      });
    }));

    test('Document suggestion should be added', (() async {
      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      await remoteDataSource.add(testSuggestionData);

      testCollection.snapshots().listen((event) {
        expect(event.docs.length, 1);
        final suggestionDocument = event.docs.first;
        expect(suggestionDocument.data(), testSuggestionData);
      });
    }));

    test('Document suggestion should be deleted', (() async {
      await testCollection.doc().set(testSuggestionData);
      final QuerySnapshot querySnapshot = await testCollection.get();
      final documentId = querySnapshot.docs.first.id;

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      await remoteDataSource.delete(documentId);
      final documentSearchResult = await testCollection.doc(documentId).get();

      expect(documentSearchResult.exists, false);
    }));

    test('Document suggestion should be updated', (() async {
      await testCollection.doc().set(testSuggestionData);
      final QuerySnapshot querySnapshot = await testCollection.get();
      final documentId = querySnapshot.docs.first.id;

      testSuggestionData['title'] = 'updatedTitle';

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: fakeFirebaseFirestore);

      await remoteDataSource.update(documentId, testSuggestionData);
      final updatedDocument = await testCollection.doc(documentId).get();

      expect(updatedDocument.data(), testSuggestionData);
    }));

    test('Suggestion should be retrieved', (() async {
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

void assertSnapshotsEquality(QuerySnapshot<Object?> resultQuerySnapshot, QuerySnapshot<Object?> expectedQuerySnapshot) {
   final expectedDocsAmount = expectedQuerySnapshot.size;
  expect(resultQuerySnapshot.size, expectedDocsAmount);
  
  final expectedDocs = expectedQuerySnapshot.docs;
  final resultDocs = resultQuerySnapshot.docs;
        
  for (int index = 0; index < expectedDocsAmount; index++) {
    expect(resultDocs[index].data(), expectedDocs[index].data());
  }
}
