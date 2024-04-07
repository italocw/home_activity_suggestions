import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_screen_data.dart';

final StateNotifierProvider<AuthScreenErrorNotifier,
    String?> authErrorCodeNotifierProvider =
StateNotifierProvider((ref) {
  return AuthScreenErrorNotifier(null);
});

class AuthScreenErrorNotifier extends StateNotifier<String?> {
  AuthScreenErrorNotifier(super.state);
}
