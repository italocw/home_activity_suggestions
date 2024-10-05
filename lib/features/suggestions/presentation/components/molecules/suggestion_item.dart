import 'package:flutter/material.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';

class SuggestionItem extends StatelessWidget {
  const SuggestionItem({
    super.key,
    required this.currentSuggestion,
  });

  final Suggestion currentSuggestion;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(currentSuggestion.title),
      subtitle: Text(currentSuggestion.description),
    );
  }
}
