import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/providers.dart';

class CenteredProgressIndicator extends ConsumerWidget {
  const CenteredProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.read(appLocalizationsProvider);
    return Center(
      child: Semantics(
        label: appLocalizations.loading,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
