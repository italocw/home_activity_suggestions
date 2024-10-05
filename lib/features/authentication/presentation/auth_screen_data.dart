
enum AuthMode { signIn, createAccount }

class AuthOrganismDynamicData {
  final String topMessage;
  final String submitButtonText;
  final String changeScreenModeButtonText;
  final AuthMode authMode;

  AuthOrganismDynamicData({required this.topMessage,
    required this.submitButtonText,
    required this.changeScreenModeButtonText,
    required this.authMode }) ;


}
