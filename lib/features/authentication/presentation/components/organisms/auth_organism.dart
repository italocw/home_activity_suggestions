import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/auth_screen_state.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/components/atoms/auth_text.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/components/atoms/generic_button.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/components/molecules/credential_input_fields_molecule.dart';

class AuthOrganism extends ConsumerWidget {
  const AuthOrganism({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final screenNotifier = ref.read(authScreenNotifierProvider.notifier);

    final screenData = ref.watch(authScreenNotifierProvider);

    void onSubmitButtonPressed() async {
      var formState = formKey.currentState!;
      final isValid = formState.validate();

      if (isValid) {
        formState.save();

        screenNotifier.submitAuthData();
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthText(text: screenData.topMessage),
          Form(
            key: formKey,
            child: const CredentialInputMolecule(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: GenericButton(
              text: screenData.submitButtonText,
              onPressed: onSubmitButtonPressed,
            ),
          ),
          GenericButton(
            text: screenData.changeScreenModeButtonText,
            onPressed: screenNotifier.switchAuthScreenMode,
          )
        ],
      ),
    );
  }
}
