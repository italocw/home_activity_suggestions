import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/create_account.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_account_test.mocks.dart';

@GenerateMocks([AuthenticationRepository, Success, Failure, DomainUser])
void main() {
  final MockAuthenticationRepository mockAuthenticationRepository =
      MockAuthenticationRepository();
  final MockSuccess<DomainUser> mockSuccess = MockSuccess();
  final MockFailure<DomainUser> mockFailure = MockFailure();
  final MockDomainUser mockDomainUser = MockDomainUser();
  late  CreateAccount createAccount;
  const String testEmail = 'email';
  const String testPassword = 'password';

  group('Create Account usecase tests', () {
    setUpAll(() {
      provideDummy<DomainUser>(mockDomainUser);

      when(mockSuccess.value).thenReturn(mockDomainUser);
      when(mockFailure.exception).thenReturn(Exception());

      provideDummy<Result<DomainUser>>(mockSuccess);

    });
    test('Should call repository create account method with successful result',
        (() async {

      when(mockAuthenticationRepository.createAccount(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => mockSuccess);

      createAccount =
          CreateAccount(authenticationRepository: mockAuthenticationRepository);

      final result =
          await createAccount(email: testEmail, password: testPassword);

      verify(await mockAuthenticationRepository.createAccount(
              email: testEmail, password: testPassword))
          .called(1);
      expect(result, mockSuccess);
    }));

      test('Should call repository create account method with failed result',
        (() async {
          when(mockAuthenticationRepository.createAccount(
              email: testEmail, password: testPassword))
              .thenAnswer((_) async => mockFailure);

          createAccount =
              CreateAccount(authenticationRepository: mockAuthenticationRepository);

          final result =
          await createAccount(email: testEmail, password: testPassword);

          verify(await mockAuthenticationRepository.createAccount(
              email: testEmail, password: testPassword))
              .called(1);
          expect(result, mockFailure);
    }));
  });
}
