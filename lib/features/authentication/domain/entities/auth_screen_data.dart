import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_activity_suggestions/features/authentication/data/firebase_auth_error_codes.dart';

enum AuthMode { signIn, createAccount }

class AuthOrganismDynamicData {
  final String topMessage;
  final String submitButtonText;
  final String changeScreenModeButtonText;
  final AuthMode authMode;
  late String? _submissionErrorMessage;

  AuthOrganismDynamicData({required this.topMessage,
    required this.submitButtonText,
    required this.changeScreenModeButtonText,
    required this.authMode,
    String? submissionErrorMessage}) ;

  get submissionError => _submissionErrorMessage;

}
