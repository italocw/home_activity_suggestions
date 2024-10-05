import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/screens/sugestions_screen.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/selected_category_state.dart';

import '../entities/suggestion_category.dart';

class OpenCategoryScreen {
  final SelectedCategoryNotifier _selectedCategoryNotifier;

  OpenCategoryScreen(
      {required SelectedCategoryNotifier selectedCategoryNotifier})
      : _selectedCategoryNotifier = selectedCategoryNotifier;

  Future call(
      {required BuildContext context, required SuggestionCategory category}) {
    log("Categoria selecionada: ${category.id}");
    _selectedCategoryNotifier.select(category);
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (builderContext) => const SuggestionsScreen()),
    );
  }
}
