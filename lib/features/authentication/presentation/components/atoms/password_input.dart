import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_input_fields_providers.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_state.dart';

import '../../../../../core/providers.dart';

class PasswordInput extends ConsumerStatefulWidget {
  const PasswordInput({super.key});

  @override
  ConsumerState<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends ConsumerState<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    const maxPasswordLength = 64;
    final appLocalizations = ref.read(appLocalizationsProvider);
    final labelText =appLocalizations.password;

    const minCharactersAmount = 6;

    final errorText = appLocalizations.this_field_must_have_between_n_and_m_characters(minCharactersAmount, maxPasswordLength);

    return TextFormField(
      obscureText: true,
      maxLength: maxPasswordLength,
      decoration:  InputDecoration(labelText: labelText, counterText: ""),
      validator: (enteredPassword) {
        if (enteredPassword == null || enteredPassword.trim().length < minCharactersAmount) {
          return errorText;
        } else {
          return null;
        }
      },
      onSaved: (enteredPassword) {
        ref.read(passwordProvider.notifier).state = enteredPassword!;
      },
    );
  }
}
