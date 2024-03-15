import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_screen_data.dart';

final authScreenModeProvider = StateProvider<AuthScreenMode>((ref) {
    return AuthScreenMode.signIn;
});