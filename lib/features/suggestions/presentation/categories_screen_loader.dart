import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/list_categories.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/open_category_screen.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/usecases_providers.dart';

final categoriesScreenLoaderProvider = Provider((ref) {
  final listCategories = ref.read(listCategoriesProvider);
  final openCategory = ref.read(openCategoryScreenProvider);

  return CategoriesScreenLoader(
      listCategories: listCategories, openCategory: openCategory);
});

class CategoriesScreenLoader {
  CategoriesScreenLoader(
      {required ListCategories listCategories,
      required OpenCategoryScreen openCategory})
      : _openCategory = openCategory,
        _listCategories = listCategories;

  final OpenCategoryScreen _openCategory;
  final ListCategories _listCategories;

  void openCategory(
          {required SuggestionCategory category,
          required BuildContext context}) =>
      _openCategory(category: category, context: context);

  List<SuggestionCategory> getCategories() => _listCategories();
}
