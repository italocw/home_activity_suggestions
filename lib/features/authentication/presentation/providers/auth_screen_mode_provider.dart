import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_screen_data.dart';
import '../../domain/usecases/switch_auth_screen_mode.dart';

final StateNotifierProvider<AuthScreenModeNotifier,
    AuthScreenMode> authScreenModeNotifierProvider =
StateNotifierProvider((ref) {
  return AuthScreenModeNotifier(AuthScreenMode.signIn);
});

class AuthScreenModeNotifier extends StateNotifier<AuthScreenMode> {
  AuthScreenModeNotifier(super.state);

  void switchMode() {
    final newMode = state == AuthScreenMode.signIn
        ? AuthScreenMode.createAccount
        : AuthScreenMode.signIn;
    state = newMode;
  }
}
