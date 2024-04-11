import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/selected_category_state.dart';

import '../../presentation/components/screens/sugestions_screen.dart';
import '../../presentation/suggestions_list_state.dart';
import '../entities/suggestion_category.dart';

class OpenCategory {
  final SelectedCategoryNotifier _selectedCategoryNotifier;

  OpenCategory({required SelectedCategoryNotifier selectedCategoryNotifier})
      : _selectedCategoryNotifier = selectedCategoryNotifier;

  Future call({required BuildContext context, required SuggestionCategory category}) {
    _selectedCategoryNotifier.select(category);
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (builderContext) => SuggestionsScreen()),
    );
  }
}
