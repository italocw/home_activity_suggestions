import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:home_activity_suggestions/features/suggestions/data/repositories/suggestion_repository_impl.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/suggestion_converter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'suggestion_repository_implementation_test.mocks.dart';

@GenerateMocks([
  SuggestionDataSource,
  Stream,
  DocumentSnapshot,
  DomainUser,
  Suggestion,
  Map,
  SuggestionConverter,
  DocumentReference,
  QuerySnapshot,
  QueryDocumentSnapshot
])
void main() {
  final MockStream<QuerySnapshot> mockStream = MockStream();
  late MockSuggestionDataSource mockDatasource;
  late MockQuerySnapshot<Object?> mockQuerySnapshot = MockQuerySnapshot();
  late MockSuggestionConverter mockSuggestionConverter;
  final MockDomainUser mockDomainUser = MockDomainUser();
  late MockMap<String, dynamic>? mockSuggestionMap = MockMap();
  final MockSuggestion mockSuggestion = MockSuggestion();
  final MockDocumentSnapshot<Object?> mockDocumentSnapshot =
      MockDocumentSnapshot();
  final MockQueryDocumentSnapshot mockQueryDocumentSnapshot =
      MockQueryDocumentSnapshot();
  const testUserId = 'uid';
  const testSuggestionId = 'suggestionId';
  late SuggestionRepositoryImpl suggestionRepository;
  late MockDocumentReference mockDocumentReference = MockDocumentReference();
  late List<MockQueryDocumentSnapshot> mockSnapshotDocsList;
  late List <MockSuggestion> mocksSuggestionsSnapshotList;

  MockFirebaseAuth(signedIn: true, mockUser: MockUser(uid: testUserId));


  setUp(() async {
    mockDatasource = MockSuggestionDataSource();

    mockSuggestionConverter = MockSuggestionConverter();

    when(mockSuggestionConverter.fromDocumentSnapshot(mockDocumentSnapshot))
        .thenReturn(mockSuggestion);
    when(mockSuggestionConverter.toMap(mockSuggestion))
        .thenReturn(mockSuggestionMap);
    when(mockDomainUser.id).thenReturn(testUserId);


    mockSnapshotDocsList = [
      mockQueryDocumentSnapshot,
      mockQueryDocumentSnapshot
    ];

    mocksSuggestionsSnapshotList = [mockSuggestion, mockSuggestion];
    when(mockQuerySnapshot.docs).thenReturn(mockSnapshotDocsList);

    when(mockSuggestionConverter
        .fromDocumentSnapshot(mockQueryDocumentSnapshot))
        .thenReturn(mockSuggestion);

    Stream<QuerySnapshot> stream = Stream.value(mockQuerySnapshot);
    when(mockDatasource.snapshots).thenAnswer((_) => stream);
  });

  group('Suggestion Repository Implementation tests', () {
    test('Datasource addition method should be called ', (() async {
      when(mockDatasource.add(mockSuggestionMap))
          .thenAnswer((_) async => mockDocumentReference);

      suggestionRepository = SuggestionRepositoryImpl(
          dataSource: mockDatasource,
          currentUser: mockDomainUser,
          suggestionConverter: mockSuggestionConverter);

      suggestionRepository.addSuggestion(mockSuggestion);

      verify(mockDatasource.add(mockSuggestionMap)).called(1);
    }));

    test('Datasource deletion method should be called ', (() async {
      when(mockDatasource.delete(testSuggestionId))
          .thenAnswer((_) async => mockDocumentReference);

      suggestionRepository = SuggestionRepositoryImpl(
          dataSource: mockDatasource,
          currentUser: mockDomainUser,
          suggestionConverter: mockSuggestionConverter);

      suggestionRepository.deleteSuggestion(testSuggestionId);

      verify(mockDatasource.delete(testSuggestionId)).called(1);
    }));

    test('Expected Suggestion should be retrieved ', (() async {
      when(mockDatasource.getById(testSuggestionId))
          .thenAnswer((_) async => mockDocumentSnapshot);

      suggestionRepository = SuggestionRepositoryImpl(
          dataSource: mockDatasource,
          currentUser: mockDomainUser,
          suggestionConverter: mockSuggestionConverter);

      final resultSuggestion =
          await suggestionRepository.getSuggestionById(testSuggestionId);

      expect(resultSuggestion, Success(mockSuggestion as Suggestion));
    }));

    test('Suggestion stream should be returned ', (() async {

      suggestionRepository = SuggestionRepositoryImpl(
          dataSource: mockDatasource,
          currentUser: mockDomainUser,
          suggestionConverter: mockSuggestionConverter);

      suggestionRepository.getSuggestionsStream().listen((suggestionsSnapshot) {
        expect(suggestionsSnapshot, mocksSuggestionsSnapshotList);
      });
    }));
  });
}
