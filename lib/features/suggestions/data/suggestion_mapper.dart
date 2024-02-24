import 'package:home_activity_sugestions/features/suggestions/domain/entities/category.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';

extension SuggetionsExtension on Suggestion {
  Map<String, String> toFirestoreMap() => {
        'id': id,
        'title': title,
        'description': description,
        'categoryId': category.id
      };
}

class SuggestionMapper {
  static Suggestion toSuggestion(Map<String, String> firestoreSuggestionMap) {
    final id = firestoreSuggestionMap['id']!;
    final title = firestoreSuggestionMap['title']!;
    final description = firestoreSuggestionMap['description']!;
    final category = categories.firstWhere(
        (category) => firestoreSuggestionMap['categoryId'] == category.id);

    return Suggestion(
        id: id, title: title, description: description, category: category);
  }
}
