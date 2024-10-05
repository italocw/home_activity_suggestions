import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/providers.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/screens/add_suggestion_screen.dart';

class AddButton extends ConsumerWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.read(appLocalizationsProvider);
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (builderContext) => const AddSuggestionsScreen()));
      },
      tooltip: appLocalizations.add_item,
    );
  }
}
