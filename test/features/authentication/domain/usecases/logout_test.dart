import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/create_account.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/logout.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_test.mocks.dart';


@GenerateMocks([AuthenticationRepository])
void main() {
  final MockAuthenticationRepository mockAuthenticationRepository =
  MockAuthenticationRepository();
  late  Logout logout;

  group('Logout usecase tests', () {

    test('Should call repository logout',
        (() async {

          when(mockAuthenticationRepository.logout())
              .thenAnswer((_) async => {});

          logout =
              Logout(authenticationRepository: mockAuthenticationRepository);

          await logout();

          verify(await mockAuthenticationRepository.logout())
              .called(1);
        }));
  });
}
