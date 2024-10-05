import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/add_suggestions_input_field_providers.dart';

import '../../../../../core/providers.dart';

class DescriptionInput extends ConsumerStatefulWidget {
  const DescriptionInput({super.key});

  @override
  ConsumerState<DescriptionInput> createState() => _DescriptionInputState();
}

class _DescriptionInputState extends ConsumerState<DescriptionInput> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.read(appLocalizationsProvider);
    final labelText = appLocalizations.description;
    const minCharactersAmount = 0;
    const maxCharactersAmount = 128;
    final errorText =
        appLocalizations.this_field_must_have_between_n_and_m_characters(
            minCharactersAmount, maxCharactersAmount);
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.text,
      maxLength: maxCharactersAmount,
      decoration: InputDecoration(labelText: labelText, counterText: ""),
      validator: (enteredDescription) {
        if (enteredDescription == null ||
            enteredDescription.trim().length < minCharactersAmount) {
          return errorText;
        } else {
          return null;
        }
      },
      onSaved: (enteredDescription) {
        ref.read(addSuggestionDescriptionProvider.notifier).state =
            enteredDescription!;
      },
    );
  }
}
