import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';

final selectedCategoryNotifierProvider =
    StateNotifierProvider<SelectedCategoryNotifier, SuggestionCategory?>((ref) {
  return SelectedCategoryNotifier(null);
});

class SelectedCategoryNotifier extends StateNotifier<SuggestionCategory?> {
  SelectedCategoryNotifier(super.state);

  void select(SuggestionCategory suggestionCategory) =>
      state = suggestionCategory;
  void unselect() => state = null;

  SuggestionCategory? get category => state;
}
