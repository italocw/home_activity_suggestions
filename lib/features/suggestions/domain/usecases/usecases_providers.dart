import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/data/data_providers.dart';
import 'package:home_activity_suggestions/features/suggestions/data/suggestion_categories.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestions_by_category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/list_categories.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/open_category_screen.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/update_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/selected_category_state.dart';

final Provider<AddSuggestion> addSuggestionProvider = Provider((ref) {
  final repository = ref.watch(suggestionRepositoryProvider);
  return AddSuggestion(suggestionRepository: repository);
});

final Provider<UpdateSuggestion> updateSuggestionsProvider = Provider((ref) {
  final repository = ref.watch(suggestionRepositoryProvider);
  return UpdateSuggestion(suggestionRepository: repository);
});

final Provider<DeleteSuggestion> deleteSuggestionProvider = Provider((ref) {
  final repository = ref.watch(suggestionRepositoryProvider);
  return DeleteSuggestion(suggestionRepository: repository);
});

final Provider<GetSuggestion> getSuggestionProvider = Provider((ref) {
  final repository = ref.watch(suggestionRepositoryProvider);
  return GetSuggestion(suggestionRepository: repository);
});

final Provider<GetSuggestionsByCategory> getSuggestionsByCategoryProvider =
    Provider((ref) {
  final selectedCategory = ref.watch(selectedCategoryNotifierProvider)!;

  log("CATEGORIA NO PROVIDER DA GET SUGGESTIONS + ${selectedCategory.id}");
  final repository = ref.watch(suggestionRepositoryProvider);
  return GetSuggestionsByCategory(
      suggestionRepository: repository, suggestionCategory: selectedCategory);
});

final Provider<ListCategories> listCategoriesProvider = Provider((ref) {
  final categories = ref.watch(categoriesProvider);
  return ListCategories(categories: categories);
});

final Provider<OpenCategoryScreen> openCategoryScreenProvider = Provider((ref) {
  final selectedCategoryNotifier =
      ref.read(selectedCategoryNotifierProvider.notifier);
  return OpenCategoryScreen(selectedCategoryNotifier: selectedCategoryNotifier);
});
