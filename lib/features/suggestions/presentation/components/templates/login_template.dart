import 'package:flutter/material.dart';
import 'package:home_activity_sugestions/features/suggestions/presentation/components/organisms/custom_app_bar.dart';
import 'package:home_activity_sugestions/features/suggestions/presentation/components/organisms/login_organism.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: 'Sugestões de atividades caseiras',
      ),
      body: const LoginOrganism(),
    );
  }
}
