import 'package:flutter/material.dart';
import 'package:home_activity_suggestions/core/components/organisms/custom_app_bar.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/components/organisms/auth_organism.dart';

class AuthTemplate extends StatelessWidget {
  const AuthTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        titleText: 'Sugestões de atividades caseiras',
      ),
      body:AuthOrganism(),
    );
  }
}
