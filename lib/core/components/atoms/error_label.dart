import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/providers.dart';

class ErrorLabel extends ConsumerWidget {
  const ErrorLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.read(appLocalizationsProvider);
    return Center(
      child: Text(
        appLocalizations.an_error_has_occurred_when_try_to_load,
      ),
    );
  }
}
