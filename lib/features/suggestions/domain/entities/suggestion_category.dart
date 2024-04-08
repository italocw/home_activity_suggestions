import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/data/suggestion_categories.dart';

class SuggestionCategory {
  final String id;
  final String name;
  final IconData iconData;
  final int color;

  SuggestionCategory({
    required this.id,
    required this.name,
    required this.iconData,
    required this.color,
  });
}

class SuggestionCategoryLocator {
  final List<SuggestionCategory> _categories;

  SuggestionCategoryLocator({required List<SuggestionCategory> categories}) : _categories = categories;

  SuggestionCategory locateCategoryById({required String id}) =>
      _categories.firstWhere((category) => id == category.id);
}

final Provider<SuggestionCategoryLocator> suggestionCategoryLocatorProvider =
Provider ((ref)  => SuggestionCategoryLocator(categories: ref.read(categoriesProvider)));


