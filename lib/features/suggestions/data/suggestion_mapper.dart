import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/category.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';

extension SuggetionsExtension on Suggestion {
  Map<String, String> toMap() =>
      {'title': title, 'description': description, 'categoryId': category.id};
}

extension SuggetionsSnapshotExtension on DocumentSnapshot<Object?> {
  Suggestion toSuggestion() {
    final suggestionData = data() as Map<String, dynamic>;
    final title = suggestionData['title']!;
    final description = suggestionData['description']!;
    final category = categories
        .firstWhere((category) => suggestionData['categoryId'] == category.id);

    return Suggestion(
        id: id, title: title, description: description, category: category);
  }
}
