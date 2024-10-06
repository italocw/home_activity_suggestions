import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/components/atoms/generic_button.dart';
import 'package:home_activity_suggestions/core/providers.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/add_suggestion_state.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/add_suggestions_input_field_providers.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/molecules/add_suggestion_input_fields_molecule.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/selected_suggestion_state.dart';

class AddSuggestionScreenBody extends ConsumerWidget {
  const AddSuggestionScreenBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final addSuggestionState = ref.read(addSuggestionStateProvider);
    final category =
        ref.read(selectedCategoryNotifierProvider.notifier).category;
    final appLocalizations = ref.read(appLocalizationsProvider);
    final categoryNameLabel = "${appLocalizations.category}: ${category!.name}";

    void onSubmitButtonPressed() async {
      var formState = formKey.currentState!;
      final isValid = formState.validate();

      if (isValid) {
        formState.save();
        final title = ref.read(addSuggestionTitleProvider);
        final description = ref.read(addSuggestionDescriptionProvider);

        final suggestion = Suggestion(
            title: title, description: description, category: category);
        addSuggestionState.addSuggestion(suggestion: suggestion);

        if (context.mounted) {
          Navigator.pop(context);
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(categoryNameLabel),
            const AddSuggestionInputFieldsMolecule(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: GenericButton(
                text: appLocalizations.add_suggestion,
                onPressed: onSubmitButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
