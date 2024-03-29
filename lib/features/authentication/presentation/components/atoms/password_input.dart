import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_input_fields_providers.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_state.dart';

class PasswordInput extends ConsumerStatefulWidget {
  const PasswordInput({super.key});

  @override
  ConsumerState<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends ConsumerState<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    const maxPasswordLength = 64;
    return TextFormField(
      obscureText: true,
      maxLength: maxPasswordLength,
      decoration: const InputDecoration(labelText: 'Password', counterText: ""),
      validator: (enteredPassword) {
        if (enteredPassword == null || enteredPassword.trim().length <= 6) {
          return 'Deve ter entre 6 e $maxPasswordLength caracteres.';
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
