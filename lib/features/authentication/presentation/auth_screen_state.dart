import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_activity_sugestions/features/authentication/data/auth_screen_data.dart';
import 'package:home_activity_sugestions/features/suggestions/data/data_providers.dart';
import 'package:home_activity_sugestions/main.dart';

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  final context = ref.read(navigatorKeyProvider).currentContext!;
  return AppLocalizations.of(context)!;
});

final authScreenNotifierProvider =
    StateNotifierProvider<AuthScreenStateNotifier, AuthScreenData>((ref) {
  final appLocalizations = ref.read(appLocalizationsProvider);
  final firebaseAuth = ref.read(firebaseAuthProvider);

  final authScreenData =
      AuthScreenData.build(AuthScreenMode.signIn, appLocalizations);

  return AuthScreenStateNotifier(
      authScreenData, appLocalizations, firebaseAuth);
});

class AuthScreenStateNotifier extends StateNotifier<AuthScreenData> {
  AuthScreenStateNotifier(
      AuthScreenData authScreenData, this._appLocalizations, this._firebaseAuth)
      : super(authScreenData);

  final AppLocalizations _appLocalizations;
  final FirebaseAuth _firebaseAuth;

  void switchAuthScreenMode() {
    final currentMode = state.authScreenMode;

    final nextMode = switch (currentMode) {
      AuthScreenMode.signIn => AuthScreenMode.createAccount,
      AuthScreenMode.createAccount => AuthScreenMode.signIn
    };

    state = AuthScreenData.build(nextMode, _appLocalizations);
  }

  void submitAuthData() {
    switch (state.authScreenMode) {
      case AuthScreenMode.signIn:
        signIn();
      case AuthScreenMode.createAccount:
        createAccount();
    }
  }

  void setEmail(String email) {
    state.email = email;
  }

  void setPassword(String password) {
    state.password = password;
  }

  signIn() => _firebaseAuth.signInWithEmailAndPassword(
      email: state.email, password: state.password);

  createAccount() => _firebaseAuth.createUserWithEmailAndPassword(
      email: state.email, password: state.password);
}
