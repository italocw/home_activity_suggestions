import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_screen_data.dart';

StateProvider<AuthScreenMode> get authScreenModeProvider => StateProvider ((ref) {
    return AuthScreenMode.signIn;
});