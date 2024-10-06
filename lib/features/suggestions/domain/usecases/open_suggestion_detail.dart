import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/molecules/suggestion_item.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/screens/sugestions_screen.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/selected_suggestion_state.dart';

import '../entities/suggestion_category.dart';

class OpenSuggestionDetail {
  final SelectedSuggestionNotifier _selectedSuggestionNotifier;

  OpenSuggestionDetail(
      {required SelectedSuggestionNotifier selectedSuggestionNotifier})
      : _selectedSuggestionNotifier = selectedCategoryNotifier;

  Future call({required BuildContext context, required Suggestion suggestion}) {
    _selectedSuggestionNotifier.select(suggestion);
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (builderContext) => const SuggestionDetail()),
    );
  }
}
