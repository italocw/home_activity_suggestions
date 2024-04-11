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

final Provider<SelectedCategoryNotifier> selectedCategoryNotifierProvider = Provider((ref) {
  return SelectedCategoryNotifier(null);
});

class SelectedCategoryNotifier extends StateNotifier<SuggestionCategory?> {

  SelectedCategoryNotifier(super.state);

  void select(SuggestionCategory suggestionCategory) => state =suggestionCategory;
  void unselect() => state = null;

   SuggestionCategory? get category => state;
}
