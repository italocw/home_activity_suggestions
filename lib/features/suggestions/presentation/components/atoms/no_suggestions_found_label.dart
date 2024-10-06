import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/providers.dart';

class NoSuggestionsFoundLabel extends ConsumerWidget {
  const NoSuggestionsFoundLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noSuggestionsFoundLabel = ref
        .read(appLocalizationsProvider)
        .no_suggestions_found_in_this_category;
    return Center(
      child: Text(noSuggestionsFoundLabel),
    );
  }
}
