import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_error_provider.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_state.dart';

import '../../../../core/providers.dart';
import '../../data/firebase_auth_error_codes.dart';
import '../../domain/entities/auth_screen_data.dart';
import 'auth_screen_mode_provider.dart';

final StateProvider<AuthOrganismDynamicData> authScreenDataProvider =
    StateProvider((ref) {
  final appLocalizations = ref.read(appLocalizationsProvider);
  final AuthMode authMode = ref.watch(authModeNotifierProvider);
  final String? authScreenErrorCode = ref.watch(authErrorCodeNotifierProvider);

  String? submissionErrorMessage =   getSubmissionErrorMessage(authScreenErrorCode, appLocalizations);

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
      submissionErrorMessage: submissionErrorMessage );
});

String? getSubmissionErrorMessage(String? authScreenErrorCode, AppLocalizations appLocalizations) {
  
  return switch (authScreenErrorCode) {
    FirebaseAuthSubmittionErrorCodes.invalidEmail =>
      appLocalizations.invalid_email,
    FirebaseAuthSubmittionErrorCodes.userDisabled =>
      appLocalizations.user_disabled,
    FirebaseAuthSubmittionErrorCodes.userNotFound =>
      appLocalizations.user_not_found,
    FirebaseAuthSubmittionErrorCodes.wrongPassword =>
      appLocalizations.invalid_credentials,
    FirebaseAuthSubmittionErrorCodes.emailAlreadyInUse =>
      appLocalizations.email_already_in_use,
    FirebaseAuthSubmittionErrorCodes.operationNotAllowed =>
      appLocalizations.invalid_credentials,
    FirebaseAuthSubmittionErrorCodes.weakPassword =>
      appLocalizations.weak_password,
    String() => null,
    null => null,
  };
}
