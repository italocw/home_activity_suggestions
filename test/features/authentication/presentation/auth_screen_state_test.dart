import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/auth_screen_data.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/create_account.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/logout.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/sign_in.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/switch_auth_screen_mode.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_error_provider.dart';
import 'package:home_activity_suggestions/features/authentication/presentation/providers/auth_screen_state.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/suggestions_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_screen_state_test.mocks.dart';

@GenerateMocks([
  CreateAccount,
  Logout,
  SignIn,
  SwitchAuthScreenMode,
  DomainUser,
  Success,
  Failure,
  AuthOrganismDynamicData,
  AuthScreenErrorNotifier
])
void main() {
  final MockSuccess<DomainUser> mockSuccess = MockSuccess();
  final MockFailure<DomainUser> mockFailure = MockFailure();
  final MockCreateAccount mockCreateAccount = MockCreateAccount();
  final MockLogout mockLogout = MockLogout();
  final MockSignIn mockSignIn = MockSignIn();
  final MockAuthScreenErrorNotifier mockAuthScreenErrorNotifier= MockAuthScreenErrorNotifier();
  final MockSwitchAuthScreenMode mockSwitchAuthScreenMode =
      MockSwitchAuthScreenMode();
  final MockDomainUser mockDomainUser = MockDomainUser();
  late MockAuthOrganismDynamicData mockAuthOrganismDynamicData =
      MockAuthOrganismDynamicData();
  late AuthScreenStateNotifier authScreenStateNotifier;
  const testEmail = "email";
  const testPassword = "password";

  void initializeAuthScreenStateNotifier() {
    authScreenStateNotifier = AuthScreenStateNotifier(
        authScreenData: mockAuthOrganismDynamicData,
        signIn: mockSignIn,
        createAccount: mockCreateAccount,
        logout: mockLogout,
        switchAuthScreenMode: mockSwitchAuthScreenMode, authScreenErrorNotifier: mockAuthScreenErrorNotifier);
  }

  group('AuthScreenStateNotifier tests', () {
    setUpAll(() {
      provideDummy<DomainUser>(mockDomainUser);

      when(mockSuccess.value).thenReturn(mockDomainUser);
      when(mockFailure.exception).thenReturn(Exception());

      provideDummy<Result<DomainUser>>(mockSuccess);

    });

    test(
        'Should call create account usecase when is on create account auth screen mode',
        (() async {
      when(mockAuthOrganismDynamicData.authMode)
          .thenReturn(AuthMode.createAccount);

      when(mockCreateAccount(email: testEmail, password: testPassword)).thenAnswer((_) async => mockSuccess);

      initializeAuthScreenStateNotifier();

       authScreenStateNotifier.submitAuth(
          email: testEmail, password: testPassword);

      verify(await mockCreateAccount(email: testEmail, password: testPassword))
          .called(1);
    }));

    test(
        'Should call sign in usecase when is on sign in auth screen mode',
        (() async {
          when(mockAuthOrganismDynamicData.authMode)
              .thenReturn(AuthMode.signIn);

          when(mockSignIn(email: testEmail, password: testPassword)).thenAnswer((_) async => mockSuccess);

          initializeAuthScreenStateNotifier();

           authScreenStateNotifier.submitAuth(
              email: testEmail, password: testPassword);

          verify(await mockSignIn(email: testEmail, password: testPassword))
              .called(1);
        }));

    test(
        'Should call logout usecase',
        (() async {
          initializeAuthScreenStateNotifier();

          await authScreenStateNotifier.logout();

          verify(await mockLogout())
              .called(1);
        }));

    test(
        'Should call switch auth screen mode usecase',
        (()  {
          initializeAuthScreenStateNotifier();

           authScreenStateNotifier.switchAuthScreenMode();

          verify( mockSwitchAuthScreenMode())
              .called(1);
        }));
  });

}
