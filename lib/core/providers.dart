import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_activity_suggestions/main.dart';

final Provider<AppLocalizations> appLocalizationsProvider = Provider((ref) {
  final context = ref.read(navigatorKeyProvider).currentContext!;
  return AppLocalizations.of(context)!;
});
