import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_activity_sugestions/features/authentication/data/data_providers.dart';
import 'package:home_activity_sugestions/features/authentication/domain/entities/auth_screen_data.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/create_account.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/sign_in.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/switch_auth_screen_mode.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/providers/auth_screen_data_provider.dart';
import 'package:home_activity_sugestions/main.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../../domain/usecases/logout.dart';

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  final context = ref.read(navigatorKeyProvider).currentContext!;
  return AppLocalizations.of(context)!;
});

final authScreenNotifierProvider =
    StateNotifierProvider<AuthScreenStateNotifier, AuthScreenData>((ref) {
  final authScreenData = ref.watch(authScreenDataProvider);

  return AuthScreenStateNotifier(
      authScreenData);
});

class AuthScreenStateNotifier extends StateNotifier<AuthScreenData> {
  AuthScreenStateNotifier(
      AuthScreenData authScreenData, this._createAccount, this._logout, this._signIn, this._switchAuthScreenMode)
      : super(authScreenData);

  final SignIn _signIn;
  final CreateAccount _createAccount;
  final Logout _logout;
  final SwitchAuthScreenMode _switchAuthScreenMode;

  Future<void> signIn(String email, String password) async =>
      _signIn(email, password);

  Future<void> createAccount(String email, String password) async =>
      _createAccount(email, password);

  Future<void> logout() async =>
      _logout();

  void switchAuthScreenMode()  => _switchAuthScreenMode();



}
