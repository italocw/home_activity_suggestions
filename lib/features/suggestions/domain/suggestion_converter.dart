import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_suggestions/features/suggestions/data/suggestion_map_keys.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';

import 'entities/suggestion_category.dart';

class SuggestionConverter {
  final SuggestionCategoryLocator _categoryLocator;

  SuggestionConverter({required SuggestionCategoryLocator categoryLocator})
      : _categoryLocator = categoryLocator;

  Map<String, dynamic> toMap(suggestion) => {
        SuggestionMapKeys.title: suggestion.title,
        SuggestionMapKeys.description: suggestion.description,
        SuggestionMapKeys.categoryId: suggestion.category.id
      };

  Suggestion fromDocumentSnapshot(
      DocumentSnapshot<Object?> suggestionDocumentSnapshot) {
    final suggestionData =
        suggestionDocumentSnapshot.data() as Map<String, dynamic>;
    final title = suggestionData[SuggestionMapKeys.title]!;
    final description = suggestionData[SuggestionMapKeys.description]!;
    final category =
        _categoryLocator.locateCategoryById(id: suggestionData[SuggestionMapKeys.categoryId]);

    return Suggestion(
        id: suggestionDocumentSnapshot.id,
        title: title,
        description: description,
        category: category);
  }
/*
  List<Suggestion> fromQuerySnapshotToSuggestionList(
      QuerySnapshot<Object?> querySnapshot) {
    return querySnapshot.docs.map((doc) => fromDocumentSnapshot(doc)).toList();
  }

  Stream<List<Suggestion>> fromQuerySnapshotStreamToSuggestionStream(
      Stream<QuerySnapshot<Object?>> querySnapshotStream) {
    return querySnapshotStream.map((querySnapshot) {
      return fromQuerySnapshotToSuggestionList(querySnapshot);
    });
  }*/
}
