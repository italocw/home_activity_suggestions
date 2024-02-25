import 'package:home_activity_sugestions/features/suggestions/data/suggestion_mapper.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/category.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:test/test.dart';

void main() {
  final Category booksCategory =
      categories.firstWhere((category) => category.name == 'Books');

  final Suggestion suggestion = Suggestion(
      id: 'id',
      title: 'title',
      description: 'description',
      category: booksCategory);

  final Map<String, String> firestoreSuggestionMap = {
    'id': 'id',
    'title': 'title',
    'description': 'description',
    'categoryId': '1'
  };

  group('Suggestion Mapper', () {
    test('Should return domain suggestion', (() {
      final suggestionResult =
          SuggestionMapper.toSuggestion(firestoreSuggestionMap);
      final expectedResult = suggestion;

      expect(suggestionResult, expectedResult);
    }));

    test('Should Firestore Map Suggestion', (() {
      final suggestionMapResult = suggestion.toFirestoreMap();
      final expectedResult = firestoreSuggestionMap;

      expect(suggestionMapResult, expectedResult);
    }));
  });
}
