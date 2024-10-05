import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/add_suggestions_input_field_providers.dart';

import '../../../../../core/providers.dart';

class TitleInput extends ConsumerStatefulWidget {
  const TitleInput({super.key});

  @override
  ConsumerState<TitleInput> createState() => _TitleInputState();
}

class _TitleInputState extends ConsumerState<TitleInput> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.read(appLocalizationsProvider);
    final labelText = appLocalizations.title;
    const minCharactersAmount = 2;
    const maxCharactersAmount = 32;
    final errorText =
        appLocalizations.this_field_must_have_between_n_and_m_characters(
            minCharactersAmount, maxCharactersAmount);
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.text,
      maxLength: maxCharactersAmount,
      decoration: InputDecoration(labelText: labelText, counterText: ""),
      validator: (enteredTitle) {
        if (enteredTitle == null ||
            enteredTitle.trim().length < minCharactersAmount) {
          return errorText;
        } else {
          return null;
        }
      },
      onSaved: (enteredTitle) {
        ref.read(addSuggestionTitleProvider.notifier).state = enteredTitle!;
      },
    );
  }
}
