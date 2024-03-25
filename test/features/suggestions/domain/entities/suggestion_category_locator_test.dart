import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'suggestion_category_locator_test.mocks.dart';

@GenerateMocks([SuggestionCategory])
void main() {
  const testCategoryId = 'id';
  final MockSuggestionCategory mockSuggestionCategory =
      MockSuggestionCategory();
  late List<MockSuggestionCategory> testCategories;
  late SuggestionCategoryLocator suggestionCategoryLocator;
  setUpAll(() {
    when(mockSuggestionCategory.id).thenReturn(testCategoryId);
    testCategories = [mockSuggestionCategory];
  });
  group('SuggestionCategoryLocator tests', () {
    test('Should return expected category', (() {
      suggestionCategoryLocator =
          SuggestionCategoryLocator(categories: testCategories);

      final resultCategory =
          suggestionCategoryLocator.locateCategoryById(id: testCategoryId);

      expect(resultCategory, mockSuggestionCategory);
    }));
  });
}
