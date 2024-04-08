
import '../../data/firebase_auth_error_codes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AuthScreenErrorMessageBuilder {
  final AppLocalizations _appLocalizations;

  AuthScreenErrorMessageBuilder({required AppLocalizations appLocalizations}) : _appLocalizations = appLocalizations;

  String? getMessage({required String errorCode}) {
    return switch (errorCode) {
      FirebaseAuthSubmissionErrorCodes.invalidEmail =>
      _appLocalizations.invalid_email,
      FirebaseAuthSubmissionErrorCodes.userDisabled =>
      _appLocalizations.user_disabled,
      FirebaseAuthSubmissionErrorCodes.userNotFound =>
      _appLocalizations.user_not_found,
      FirebaseAuthSubmissionErrorCodes.wrongPassword =>
      _appLocalizations.invalid_credentials,
      FirebaseAuthSubmissionErrorCodes.emailAlreadyInUse =>
      _appLocalizations.email_already_in_use,
      FirebaseAuthSubmissionErrorCodes.operationNotAllowed =>
      _appLocalizations.invalid_credentials,
      FirebaseAuthSubmissionErrorCodes.weakPassword =>
      _appLocalizations.weak_password,
      FirebaseAuthSubmissionErrorCodes.channelError =>
      _appLocalizations.invalid_credentials,
      String() => _appLocalizations.some_error_has_occurred_during_the_operation
    };
  }
}
