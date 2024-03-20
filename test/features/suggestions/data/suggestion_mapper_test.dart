import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:home_activity_suggestions/features/suggestions/data/suggestion_mapper.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
/*
@GenerateMocks([DocumentSnapshot<Object?>])
void main() {
  final Category booksCategory =
      categories.firstWhere((category) => category.name == 'Books');

  final Suggestion suggestion = Suggestion(
      id: 'id',
      title: 'title',
      description: 'description',
      category: booksCategory);

  final Map<String, dynamic> firestoreSuggestionMap = {
    'title': 'title',
    'description': 'description',
    'categoryId': '1'
  };

  group('Suggestion Mapper', () {
    test('Should return domain suggestion', (() {
      final suggestionDocumentMock = MockDocumentSnapshot();

      when(suggestionDocumentMock.id).thenAnswer((_) => 'id');

      when(suggestionDocumentMock.data())
          .thenAnswer((_) => firestoreSuggestionMap);

      final suggestionResult = suggestionDocumentMock.toSuggestion();

      final expectedResult = suggestion;

      expect(suggestionResult, expectedResult);
    }));

    test('Should throw exception when try to use unexpected data', (() {
      final suggestionDocumentMock = MockDocumentSnapshot();

      final unexpectedData = {'nonValidField': 'nonValidValue'};

      when(suggestionDocumentMock.id).thenAnswer((_) => 'id');

      when(suggestionDocumentMock.data()).thenAnswer((_) => unexpectedData);

      result() => suggestionDocumentMock.toSuggestion();

      expect(result, throwsA(TypeMatcher<TypeError>()));
    }));

    test('Should Firestore Map Suggestion', (() {
      final suggestionMapResult = suggestion.toMap();
      final expectedResult = firestoreSuggestionMap;

      expect(suggestionMapResult, expectedResult);
    }));
  });
}
*/