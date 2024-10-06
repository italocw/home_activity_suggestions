import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/atoms/suggestion_description.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/atoms/suggestion_title.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/selected_suggestion_state.dart';

class SuggestionItem extends ConsumerWidget {
  const SuggestionItem({
    super.key,
    required this.suggestion,
  });

  final Suggestion suggestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SuggestionDescription? descriptionWidget;
    if (suggestion.description.trim().isNotEmpty) {
      descriptionWidget =
          SuggestionDescription(description: suggestion.description);
    }

    return GestureDetector(
      onTap: () => ref
          .read(selectedSuggestionNotifierProvider)
          .openSuggestion(category: suggestion, context: context),
      child: Card.outlined(
        child: ListTile(
          title: SuggestionTitle(title: suggestion.title),
          subtitle: descriptionWidget,
        ),
      ),
    );
  }
}
