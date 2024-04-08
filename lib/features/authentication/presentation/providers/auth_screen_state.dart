import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/auth_screen_data.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/create_account.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/sign_in.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/switch_auth_screen_mode.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/usecases_providers.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_data_provider.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_error_message_builder.dart';

import '../../../../core/data/result.dart';
import '../../data/data_providers.dart';
import '../../domain/usecases/logout.dart';

final authScreenNotifierProvider =
    StateNotifierProvider<AuthScreenStateNotifier, AuthOrganismDynamicData>(
        (ref) {
  final authScreenData = ref.watch(authScreenDataProvider);
  final signIn = ref.read(signInProvider);
  final createAccount = ref.read(createAccountProvider);
  final logout = ref.read(logoutProvider);
  final switchAuthScreenMode = ref.read(switchAuthScreenModeProvider);
  final errorMessageBuilderProvider =
      ref.watch(authScreenErrorMessageBuilderProvider);
  return AuthScreenStateNotifier(
      authScreenData: authScreenData,
      signIn: signIn,
      createAccount: createAccount,
      logout: logout,
      switchAuthScreenMode: switchAuthScreenMode,
      errorMessageBuilder: errorMessageBuilderProvider);
});

class AuthScreenStateNotifier extends StateNotifier<AuthOrganismDynamicData> {
  AuthScreenStateNotifier(
      {required AuthOrganismDynamicData authScreenData,
      required SignIn signIn,
      required CreateAccount createAccount,
      required Logout logout,
      required SwitchAuthScreenMode switchAuthScreenMode,
      required AuthScreenErrorMessageBuilder errorMessageBuilder})
      : _signIn = signIn,
        _createAccount = createAccount,
        _logout = logout,
        _switchAuthScreenMode = switchAuthScreenMode,
        _errorMessageBuilder = errorMessageBuilder,
        super(authScreenData);

  final SignIn _signIn;
  final CreateAccount _createAccount;
  final Logout _logout;
  final SwitchAuthScreenMode _switchAuthScreenMode;
  final AuthScreenErrorMessageBuilder _errorMessageBuilder;

  Future<Result<DomainUser>> _doSignIn(
          {required String email, required String password}) =>
      _signIn(email: email, password: password);

  Future<Result<DomainUser>> _doCreateAccount(
          {required String email, required String password}) =>
      _createAccount(email: email, password: password);

  Future<String?> submitAuth(
      {required String email, required String password}) async {
    final submissionResult = switch (state.authMode) {
      AuthMode.createAccount =>
        await _doCreateAccount(email: email, password: password),
      AuthMode.signIn => await _doSignIn(email: email, password: password)
    };

    if (submissionResult is Failure<DomainUser>) {
      final errorCode =
          (submissionResult.exception as FirebaseAuthException).code;

      return Future.value(
          _errorMessageBuilder.getMessage(errorCode: errorCode));
    } else {
      return Future.value(null);
    }
  }

  Future<void> logout() => _logout();

  void switchAuthScreenMode() {
    _switchAuthScreenMode();
  }
}
