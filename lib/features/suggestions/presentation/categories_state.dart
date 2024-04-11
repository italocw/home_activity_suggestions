import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestions_by_category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/list_categories.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/open_category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/update_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/usecases_providers.dart';

import '../../../core/data/result.dart';

final Provider<CategoriesNotifier> categoriesNotifierProvider = Provider((ref) {
  final listCategories = ref.read(listCategoriesProvider);
  final openCategory = ref.read(openCategoryProvider);

  return CategoriesNotifier(
      listCategories: listCategories, openCategory: openCategory);
});

class CategoriesNotifier extends StateNotifier<List<SuggestionCategory>> {
  CategoriesNotifier(
      {required ListCategories listCategories,
      required OpenCategory openCategory})
      : _openCategory = openCategory,
        super(listCategories());

  final OpenCategory _openCategory;

  void openCategory(
          {required SuggestionCategory category,
          required BuildContext context}) =>
      _openCategory(category: category, context: context);
}
