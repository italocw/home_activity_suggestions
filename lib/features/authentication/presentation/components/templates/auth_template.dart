import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/components/organisms/custom_app_bar.dart';
import 'package:home_activity_suggestions/core/providers.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/components/organisms/auth_organism.dart';

class AuthTemplate extends ConsumerWidget {
  const AuthTemplate({super.key});

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final appTitle = ref.read(appLocalizationsProvider).app_title;
    return  Scaffold(
      appBar: CustomAppBar(
        titleText:appTitle
      ),
      body:const AuthOrganism(),
    );
  }
}
