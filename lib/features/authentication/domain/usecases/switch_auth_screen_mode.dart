import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/auth_screen_data.dart';

class SwitchAuthScreenMode {
  final StateController<AuthScreenMode> _screenModeStateController;

  SwitchAuthScreenMode(
      {required StateController<AuthScreenMode> screenModeStateController})
      : _screenModeStateController = screenModeStateController;

  call () {
    final newMode = _screenModeStateController.state == AuthScreenMode.signIn
        ? AuthScreenMode.createAccount
        : AuthScreenMode.signIn;
    _screenModeStateController.state = newMode;
  }
}
