import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/providers/auth_screen_state.dart';

import '../../../../../core/providers.dart';
import '../../providers/auth_input_fields_providers.dart';

class EmailInput extends ConsumerStatefulWidget {
  const EmailInput({super.key});

  @override
  ConsumerState<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends ConsumerState<EmailInput> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.read(appLocalizationsProvider);
    final labelText =appLocalizations.email;
    const maxEmailLengthAccordingRFC = 254;

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      maxLength: maxEmailLengthAccordingRFC,
      decoration:  InputDecoration(labelText: labelText,counterText: ""),
      validator: (enteredName) {
        if (enteredName == null || enteredName.trim().length <= 1) {
          return 'Deve ter entre 1 e $maxEmailLengthAccordingRFC caracteres.';
        } else {
          return null;
        }
      },
      onSaved: (enteredEmail) {
        ref.read(emailProvider.notifier).state = enteredEmail!;
      },
    );
  }
}
