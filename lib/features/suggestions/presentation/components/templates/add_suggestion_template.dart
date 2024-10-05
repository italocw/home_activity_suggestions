import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/providers.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/organisms/add_suggestion_screen_body.dart';

import '../../../../../core/components/organisms/custom_app_bar.dart';

class AddSuggestionTemplate extends ConsumerWidget {
  const AddSuggestionTemplate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.read(appLocalizationsProvider);
    return Scaffold(
        appBar: CustomAppBar(titleText: appLocalizations.add_item),
        body: const AddSuggestionScreenBody());
  }
}
