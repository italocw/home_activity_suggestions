import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_suggestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'suggestion_datasource_test.mocks.dart';

@GenerateMocks(
    [CollectionReference, FirebaseFirestore, Stream, DocumentReference, Map])
void main() {
  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockMap<String, dynamic> mockSuggestionData;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentReference;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockStream<QuerySnapshot<Map<String, dynamic>>> mockStream;
  const String testCollectionPath = 'suggestions';
  const String testDocumentPath = 'id';
  setUp(() {
    mockSuggestionData = MockMap();
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference();
    mockStream = MockStream();
    when(mockCollectionReference.snapshots()).thenAnswer((_) => mockStream);

    mockDocumentReference = MockDocumentReference();
  });

  group('Data source tests', () {
    test('Should return document snapshot', (() async {
      when(mockFirebaseFirestore.collection(testCollectionPath))
          .thenReturn(mockCollectionReference);

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: mockFirebaseFirestore);

      final snapshotResult = remoteDataSource.snapshots;
      expect(snapshotResult, mockStream);
    }));

    test('Document suggestion should be added', (() async {
      when(mockFirebaseFirestore.collection(testCollectionPath))
          .thenReturn(mockCollectionReference);

      when(mockCollectionReference.add(mockSuggestionData))
          .thenAnswer((_) async => mockDocumentReference);

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: mockFirebaseFirestore);

      final resultDocumentReference =
          await remoteDataSource.add(mockSuggestionData);

      verify(await mockCollectionReference.add(mockSuggestionData)).called(1);

      expect(resultDocumentReference, mockDocumentReference);
    }));

    test('Document suggestion should be deleted', (() async {
      when(mockDocumentReference.delete()).thenAnswer((_) async {});
      when(mockCollectionReference.doc(testDocumentPath))
          .thenReturn(mockDocumentReference);

      when(mockFirebaseFirestore.collection(testCollectionPath))
          .thenReturn(mockCollectionReference);

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: mockFirebaseFirestore);

      await remoteDataSource.delete(testDocumentPath);

      verify(await mockDocumentReference.delete()).called(1);
    }));

    test('Document suggestion should be updated', (() async {
      when(mockDocumentReference.update(mockSuggestionData))
          .thenAnswer((_) async {});
      when(mockCollectionReference.doc(testDocumentPath))
          .thenReturn(mockDocumentReference);
      when(mockFirebaseFirestore.collection(testCollectionPath))
          .thenReturn(mockCollectionReference);

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: mockFirebaseFirestore);

      await remoteDataSource.update(testDocumentPath, mockSuggestionData);

      verify(await mockDocumentReference.update(mockSuggestionData)).called(1);
    }));

    test('Suggestion should be retrieved', (() async {
      when(mockDocumentReference.update(mockSuggestionData))
          .thenAnswer((_) async {});
      when(mockCollectionReference.doc(testDocumentPath))
          .thenReturn(mockDocumentReference);
      when(mockFirebaseFirestore.collection(testCollectionPath))
          .thenReturn(mockCollectionReference);

      final SuggestionDataSource remoteDataSource =
          SuggestionDataSource(firebaseFirestore: mockFirebaseFirestore);

      await remoteDataSource.update(testDocumentPath, mockSuggestionData);

      verify(await mockDocumentReference.update(mockSuggestionData)).called(1);
    }));
  });
}
