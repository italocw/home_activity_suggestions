import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_error_message_builder.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_state.dart';

import '../../../../core/providers.dart';
import '../../data/firebase_auth_error_codes.dart';
import '../../domain/entities/auth_screen_data.dart';
import 'auth_screen_mode_provider.dart';

final StateProvider<AuthOrganismDynamicData> authScreenDataProvider =
    StateProvider((ref) {
  final appLocalizations = ref.read(appLocalizationsProvider);
  final AuthMode authMode = ref.watch(authModeNotifierProvider);

  String topMessage;
  String submitButtonText;
  String changeScreenModeButtonText;

  switch (authMode) {
    case AuthMode.signIn:
      topMessage = appLocalizations.welcome_message;
      submitButtonText = appLocalizations.enter;
      changeScreenModeButtonText = appLocalizations.dont_have_account_message;
      break;
    case AuthMode.createAccount:
      topMessage = appLocalizations.create_account_message;
      submitButtonText = appLocalizations.create_account;
      changeScreenModeButtonText =
          appLocalizations.already_have_account_message;
      break;
  }


  return AuthOrganismDynamicData(
      topMessage: topMessage,
      submitButtonText: submitButtonText,
      changeScreenModeButtonText: changeScreenModeButtonText,
      authMode: authMode,
   );
});

