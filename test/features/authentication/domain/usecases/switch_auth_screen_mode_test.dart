import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/switch_auth_screen_mode.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_mode_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'switch_auth_screen_mode_test.mocks.dart';

@GenerateMocks([AuthScreenModeNotifier])
void main() {
  final MockAuthScreenModeNotifier mockAuthScreenModeNotifier =
      MockAuthScreenModeNotifier();
  late SwitchAuthScreenMode switchAuthScreenMode;

  group('SwitchAuthScreenMode usecase tests', () {
    test('Should call switchMode method from AuthScreenModeNotifier', (() {
      switchAuthScreenMode = SwitchAuthScreenMode(
          authScreenModeNotifier: mockAuthScreenModeNotifier);

      switchAuthScreenMode();

      verify(mockAuthScreenModeNotifier.switchMode()).called(1);
    }));
  });
}
