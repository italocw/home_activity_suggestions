import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum AuthScreenMode { signIn, createAccount }

class AuthScreenData {
  AuthScreenData({
    required String topMessage,
    required String submitButtonText,
    required String changeScreenModeButtonText,
    required AuthScreenMode screenMode,
  })   : _topMessage = topMessage,
        _submitButtonText = submitButtonText,
        _changeScreenModeButtonText = changeScreenModeButtonText,
        _authScreenMode = screenMode;

  final String _topMessage;
  final String _submitButtonText;
  final String _changeScreenModeButtonText;
  final AuthScreenMode _authScreenMode;

  String get topMessage => _topMessage;
  String get submitButtonText => _submitButtonText;
  String get changeScreenModeButtonText => _changeScreenModeButtonText;
  AuthScreenMode get authScreenMode => _authScreenMode;
}
