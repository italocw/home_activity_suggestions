import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:home_activity_suggestions/features/suggestions/data/suggestion_map_keys.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/suggestion_converter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'suggestion_converter_test.mocks.dart';

@GenerateMocks([
  QueryDocumentSnapshot,
  SuggestionCategoryLocator,
  Suggestion,
  SuggestionCategory
])
void main() {
  late MockSuggestionCategory mockCategory = MockSuggestionCategory();
  const String testSuggestionId = 'docSnapshotId';
  final MockSuggestionCategoryLocator mockCategoryLocator =
      MockSuggestionCategoryLocator();
  late MockSuggestion mockSuggestion = MockSuggestion();
  late SuggestionConverter suggestionConverter;
  const testTitle = 'title';
  const testDescription = 'description';
  const testCategoryId = 'categoryId';
  late MockQueryDocumentSnapshot mockQueryDocumentSnapshot =
      MockQueryDocumentSnapshot();

  group('Suggestion Converter tests', () {
    void inputMockSuggestionData() {
      when(mockSuggestion.id).thenReturn(testSuggestionId);
      when(mockSuggestion.title).thenReturn(testTitle);
      when(mockSuggestion.category).thenReturn(mockCategory);
      when(mockSuggestion.description).thenReturn(testDescription);
    }

    void compareSuggestionData(Suggestion suggestionResult, MockSuggestion mockSuggestion) {
     expect(suggestionResult.id, mockSuggestion.id);
      expect(suggestionResult.title, mockSuggestion.title);
      expect(suggestionResult.description, mockSuggestion.description);
      expect(suggestionResult.category, mockSuggestion.category);
    }

    void inputMockDocumentData() {
      final suggestionData = {
        SuggestionMapKeys.title: testTitle,
        SuggestionMapKeys.description: testDescription,
        SuggestionMapKeys.categoryId: testCategoryId
      };

      when(mockQueryDocumentSnapshot.data()).thenReturn(suggestionData);
      when(mockQueryDocumentSnapshot.id).thenReturn(testSuggestionId);
    }

    setUpAll(() {
      when(mockCategory.id).thenReturn(testCategoryId);

      when(mockCategoryLocator.locateCategoryById(id: testCategoryId))
          .thenReturn(mockCategory);

      suggestionConverter =
          SuggestionConverter(categoryLocator: mockCategoryLocator);

      inputMockDocumentData();
      inputMockSuggestionData();
    });

    test('Should return expected suggestion from document snapshot', (() {
      final suggestionResult =
          suggestionConverter.fromDocumentSnapshot(mockQueryDocumentSnapshot);

      compareSuggestionData(suggestionResult, mockSuggestion);
    }));


    test('Should return Firestore Suggestion Map', (() {
      final mapResult = suggestionConverter.toMap(mockSuggestion);

      expect(mapResult, mockQueryDocumentSnapshot.data());
    }));
  });
}
