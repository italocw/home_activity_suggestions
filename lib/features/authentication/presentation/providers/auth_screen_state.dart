import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/authentication/domain/entities/auth_screen_data.dart';
import 'package:home_activity_sugestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/create_account.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/sign_in.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/switch_auth_screen_mode.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/usecases_providers.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/providers/auth_screen_data_provider.dart';

import '../../domain/usecases/logout.dart';

final authScreenNotifierProvider =
    StateNotifierProvider<AuthScreenStateNotifier, AuthOrganismDynamicData>(
        (ref) {
  final authScreenData = ref.watch(authScreenDataProvider);
  final signIn = ref.read(signInProvider);
  final createAccount = ref.read(createAccountProvider);
  final logout = ref.read(logoutProvider);
  final switchAuthScreenMode = ref.read(switchAuthScreenModeProvider);
  return AuthScreenStateNotifier(
      authScreenData, signIn, createAccount, logout, switchAuthScreenMode);
});

class AuthScreenStateNotifier extends StateNotifier<AuthOrganismDynamicData> {
  AuthScreenStateNotifier(AuthOrganismDynamicData authScreenData, this._signIn,
      this._createAccount, this._logout, this._switchAuthScreenMode)
      : super(authScreenData);

  final SignIn _signIn;
  final CreateAccount _createAccount;
  final Logout _logout;
  final SwitchAuthScreenMode _switchAuthScreenMode;

  Future<DomainUser> _doSignIn(
          {required String email, required String password}) =>
      _signIn(email: email, password: password);

  Future<DomainUser> _doCreateAccount(
          {required String email, required String password}) =>
      _createAccount(email: email, password: password);

  Future<DomainUser> submitAuth(
      {required String email, required String password}) {
    final returnedDomainUser = switch (state.authMode) {
      AuthMode.createAccount =>
        _doCreateAccount(email: email, password: password),
      AuthMode.signIn => _doSignIn(email: email, password: password)
    };

    return returnedDomainUser;
  }

  Future<void> logout() => _logout();

  void switchAuthScreenMode() {
    _switchAuthScreenMode();
  }
}
