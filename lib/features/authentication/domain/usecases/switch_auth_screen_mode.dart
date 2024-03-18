import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers/auth_screen_mode_provider.dart';
import '../entities/auth_screen_data.dart';

class SwitchAuthScreenMode {
  SwitchAuthScreenMode({required AuthScreenModeNotifier authScreenModeNotifier})
      : _authScreenModeNotifier = authScreenModeNotifier;
 final AuthScreenModeNotifier _authScreenModeNotifier;

  void call() {
    _authScreenModeNotifier.switchMode();
  }
}
