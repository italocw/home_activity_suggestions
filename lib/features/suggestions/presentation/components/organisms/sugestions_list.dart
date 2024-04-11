import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/atoms/category_icon.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/suggestions_list_state.dart';

import '../../../domain/entities/suggestion.dart';
import '../atoms/category_name.dart';
import '../molecules/category_item.dart';

class SuggestionsList extends ConsumerWidget {
  const SuggestionsList({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Suggestion> suggestions = ref.read(suggestionsNotifierProvider).state;
    return ListView(
      padding: const EdgeInsets.all(8),
      children: suggestions
          .map(
            (category) => Placeholder(),
          )
          .toList(),
    );
  }
}
