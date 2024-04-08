import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_input_fields_providers.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_error_message_builder.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_state.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/components/atoms/auth_text.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/components/atoms/generic_button.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/components/molecules/credential_input_fields_molecule.dart';

class AuthOrganism extends ConsumerWidget {
  const AuthOrganism({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final screenNotifier = ref.watch(authScreenNotifierProvider.notifier);
    final screenData = ref.watch(authScreenNotifierProvider);

    final email = ref.read(emailProvider);
    final password = ref.read(passwordProvider);



    void onSubmitButtonPressed() async {
      var formState = formKey.currentState!;
      final isValid = formState.validate();

      String? submissionError ;
      if (isValid) {
        formState.save();
    submissionError= await    screenNotifier.submitAuth(email: email, password: password);
      }

      if (context.mounted) {
        ScaffoldMessengerState scaffoldMessengerState = ScaffoldMessenger.of(
            context);
        scaffoldMessengerState.clearSnackBars();

        if (submissionError != null) {
          scaffoldMessengerState.showSnackBar(
            SnackBar(
              content: Text(submissionError),
            ),
          );
        }
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
