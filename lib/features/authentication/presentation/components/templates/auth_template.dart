import 'package:flutter/material.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/components/organisms/auth_organism.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/components/organisms/custom_app_bar.dart';

import '../../../../../core/gradient_background.dart';

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
