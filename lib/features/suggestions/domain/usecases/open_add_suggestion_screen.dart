import 'package:flutter/material.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/screens/add_suggestion_screen.dart';

class OpenAddSuggestionScreen {
  Future call({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
          builder: (builderContext) => const AddSuggestionsScreen()),
    );
  }
}
