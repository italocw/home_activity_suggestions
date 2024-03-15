import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/providers/auth_screen_state.dart';

import '../../domain/entities/auth_screen_data.dart';
import 'auth_screen_mode_provider.dart';

get authScreenDataProvider => StateProvider<AuthScreenData>((ref) {
      final appLocalizations = ref.watch(appLocalizationsProvider);
      final AuthScreenMode authScreenMode = ref.watch(authScreenModeProvider);

      String topMessage;
      String submitButtonText;
      String changeScreenModeButtonText;

      switch (authScreenMode) {
        case AuthScreenMode.signIn:
          topMessage = appLocalizations.wellcome_message;
          submitButtonText = appLocalizations.enter;
          changeScreenModeButtonText =
              appLocalizations.dont_have_account_message;
        case AuthScreenMode.createAccount:
          topMessage = appLocalizations.create_account_message;
          submitButtonText = appLocalizations.create_account;
          changeScreenModeButtonText =
              appLocalizations.already_have_account_message;
      }

      return AuthScreenData(
          topMessage: topMessage,
          submitButtonText: submitButtonText,
          changeScreenModeButtonText: changeScreenModeButtonText,
          screenMode: authScreenMode);
    });