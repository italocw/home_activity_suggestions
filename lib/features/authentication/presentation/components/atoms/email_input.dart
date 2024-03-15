import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/providers/auth_screen_state.dart';

class EmailInput extends ConsumerStatefulWidget {
  const EmailInput({super.key});

  @override
  ConsumerState<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends ConsumerState<EmailInput> {
  @override
  Widget build(BuildContext context) {
    const maxEmailLengthAccordingRFC = 254;
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      maxLength: maxEmailLengthAccordingRFC,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (enteredName) {
        if (enteredName == null || enteredName.trim().length <= 1) {
          return 'Deve ter entre 1 e $maxEmailLengthAccordingRFC caracteres.';
        } else {
          return null;
        }
      },
      onSaved: (enteredEmail) {
        final screenNotifier = ref.read(authScreenNotifierProvider.notifier);
        screenNotifier.setEmail(enteredEmail!);
      },
    );
  }
}
