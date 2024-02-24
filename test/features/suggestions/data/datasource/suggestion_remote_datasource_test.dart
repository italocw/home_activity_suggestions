import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_remote_datasource.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/category.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:test/test.dart';

void main() {
  final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

  const String collectionPath = 'suggestions';
  const String documentPath = 'path';
  const Map<String, dynamic> data = {'answer': 42};
  final Category booksCategory =
      categories.firstWhere((category) => category.name == 'Books');
  final Suggestion suggestion = Suggestion(
      id: '1',
      title: 'title',
      description: 'description',
      category: booksCategory);

  group('Remote data source tests', () {
    test('Should return suggestions list', (() async {
      await fakeFirebaseFirestore
          .collection(collectionPath)
          .doc(documentPath)
          .set(data);
      final SuggestionRemoteDataSource remoteDataSource =
          SuggestionRemoteDataSource(firebaseFirestore: fakeFirebaseFirestore);

      remoteDataSource.add(suggestion);

      final getAllResult = remoteDataSource.getAll();

      final expectedResult = [suggestion];
      expect(getAllResult, expectedResult);
    }));

    test('Suggestion should be added', () async {
      final SuggestionRemoteDataSource remoteDataSource =
          SuggestionRemoteDataSource(firebaseFirestore: fakeFirebaseFirestore);

      remoteDataSource.add(suggestion);

      final getAllResult = remoteDataSource.getAll();

      final expectedResult = [suggestion];
      expect(getAllResult, expectedResult);
    });
  });
}
