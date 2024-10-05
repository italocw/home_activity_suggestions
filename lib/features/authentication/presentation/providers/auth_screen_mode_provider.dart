import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_screen_data.dart';

final StateNotifierProvider<AuthScreenModeNotifier, AuthMode>
    authModeNotifierProvider = StateNotifierProvider((ref) {
  return AuthScreenModeNotifier(AuthMode.signIn);
});

class AuthScreenModeNotifier extends StateNotifier<AuthMode> {
  AuthScreenModeNotifier(super.state);

  void switchMode() {
    final newMode =
        state == AuthMode.signIn ? AuthMode.createAccount : AuthMode.signIn;
    state = newMode;
  }
}
