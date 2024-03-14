import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum AuthScreenMode { signIn, createAccount }

class AuthScreenData {
  AuthScreenData._(this.authScreenMode);
  late String _topMessage;
  late String _submitButtonText;
  String email = "";
  String password = "";
  late String _changeScreenModeButtonText;
  final AuthScreenMode authScreenMode;

  static AuthScreenData build(
      AuthScreenMode authScreenMode, AppLocalizations appLocalizations) {
    final authScreenData = AuthScreenData._(authScreenMode);
    authScreenData._setFieldsByMode(appLocalizations);

    return authScreenData;
  }

  void _setFieldsByMode(AppLocalizations appLocalizations) {
    switch (authScreenMode) {
      case AuthScreenMode.signIn:
        _topMessage = appLocalizations.wellcome_message;
        _submitButtonText = appLocalizations.enter;
        _changeScreenModeButtonText =
            appLocalizations.dont_have_account_message;
      case AuthScreenMode.createAccount:
        _topMessage = appLocalizations.create_account_message;
        _submitButtonText = appLocalizations.create_account;
        _changeScreenModeButtonText =
            appLocalizations.already_have_account_message;
    }
  }

  String get topMessage => _topMessage;
  String get submitButtonText => _submitButtonText;
  String get changeScreenModeButtonText => _changeScreenModeButtonText;
}
