import 'package:flutter/material.dart';
import 'package:home_activity_sugestions/features/suggestions/presentation/components/atoms/email_input.dart';
import 'package:home_activity_sugestions/features/suggestions/presentation/components/atoms/password_input.dart';

class CredentialInputMolecule extends StatelessWidget {
  const CredentialInputMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [EmailInput(), PasswordInput()],
    );
  }
}
