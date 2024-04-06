
import '../../presentation/providers/auth_screen_mode_provider.dart';

class SwitchAuthScreenMode {
  SwitchAuthScreenMode({required AuthScreenModeNotifier authScreenModeNotifier})
      : _authScreenModeNotifier = authScreenModeNotifier;
 final AuthScreenModeNotifier _authScreenModeNotifier;

  void call() {
    _authScreenModeNotifier.switchMode();
  }
}
