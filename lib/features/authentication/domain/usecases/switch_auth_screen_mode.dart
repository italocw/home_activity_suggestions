import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers/auth_screen_mode_provider.dart';
import '../entities/auth_screen_data.dart';

class SwitchAuthScreenMode {
    call ()  {
    Provider((ref) {
       ref.read(authScreenModeNotifierProvider.notifier).switchMode();
    });
  }
}
