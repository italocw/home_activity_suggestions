import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/suggestions/data/data_providers.dart';
import 'package:home_activity_sugestions/features/suggestions/presentation/components/atoms/generic_button.dart';
import 'package:home_activity_sugestions/features/suggestions/presentation/components/atoms/hello_text.dart';
import 'package:home_activity_sugestions/features/suggestions/presentation/components/molecules/credential_input_fields_molecule.dart';

class LoginOrganism extends ConsumerWidget {
  const LoginOrganism({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    void onLoginPressed() async {
      var formState = formKey.currentState!;
      final isValid = formState.validate();

      if (isValid) {
        formState.save();
        final authService = ref.read(firebaseAuthServiceProvider);

        await authService.signIn();
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HelloText(),
          Form(
            key: formKey,
            child: const CredentialInputMolecule(),
          ),
          SizedBox(
            height: 16,
          ),
          GenericButton(
            text: 'Login',
            onPressed: onLoginPressed,
          )
        ],
      ),
    );
  }
}
