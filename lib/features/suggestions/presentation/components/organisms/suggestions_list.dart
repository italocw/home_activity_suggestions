import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/providers.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/molecules/suggestion_item.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/selected_category_state.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/suggestions_list_state.dart';

import '../../../domain/entities/suggestion.dart';

class SuggestionsList extends ConsumerWidget {
  const SuggestionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Stream<List<Suggestion>> suggestionsStream = ref
        .watch(suggestionsNotifierProvider.notifier)
        .getSuggestionsByCategory();

    SelectedCategoryNotifier selectedCategoryNotifier =
        ref.watch(selectedCategoryNotifierProvider.notifier);
    final appLocalizations = ref.read(appLocalizationsProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: StreamBuilder<List<Suggestion>>(
        stream: suggestionsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text(
              appLocalizations.no_suggestions_found_in_this_category,
              textAlign: TextAlign.center,
            );
          }

          final suggestions = snapshot.data!;
          return PopScope(
            onPopInvokedWithResult: (bool didPop, Object? result) {
              if (didPop) {
                selectedCategoryNotifier.unselect();
                return;
              }
            },
            child: ListView.builder(
              itemCount: suggestions.length, // Quantidade de itens na lista
              itemBuilder: (context, index) {
                final currentSuggestion = suggestions[index];
                return SuggestionItem(currentSuggestion: currentSuggestion);
              },
            ),
          );
        },
      ),
    );
  }
}
