import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/atoms/add_button.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/selected_category_state.dart';

import '../../../../../core/components/organisms/custom_app_bar.dart';
import '../organisms/suggestions_list.dart';

class SuggestionsTemplate extends ConsumerWidget {
  const SuggestionsTemplate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryName =
        ref.read(selectedCategoryNotifierProvider.notifier).category!.name;
    return Scaffold(
      appBar:
          CustomAppBar(titleText: categoryName, actions: const [AddButton()]),
      body: const SuggestionsList(),
    );
  }
}
