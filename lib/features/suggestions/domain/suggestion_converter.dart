import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';

import 'entities/category.dart';


class SuggestionConverter {
     Map<String, String> toMap(suggestion) =>
         {'title': suggestion.title, 'description': suggestion.description, 'categoryId': suggestion.category.id};
   Suggestion fromDocumentSnapshot(DocumentSnapshot<Object?> documentSnapshotSuggestion) {
     final suggestionData = documentSnapshotSuggestion.data() as Map<String, dynamic>;
     final title = suggestionData['title']!;
     final description = suggestionData['description']!;
     final category = categories
         .firstWhere((category) => suggestionData['categoryId'] == category.id);

     return Suggestion(
         id: documentSnapshotSuggestion.id, title: title, description: description, category: category);
   }
}
