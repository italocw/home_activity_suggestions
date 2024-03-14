import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@GenerateMocks([AppLocalizations])
void main() {
  MockAppLocalizations mockAppLocalizations;

  setUp(() {
    mockAppLocalizations = MockAppLocalizations();
    when(mockAppLocalizations.getText(anyNamed('text'))).thenReturn("");
  });
  group('Auth screen data tests', () {
    /* test('Should call firebase auth sign in with expected data', () async {
      final expectedResult = await Future.value(mockUserCredential);
      when(mockFirebaseAuth.getT(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => expectedResult);

      final signInResult = await firebaseAuthServiceSUT.signIn();

      verify(await mockFirebaseAuth.signInWithEmailAndPassword(
              email: testUserEmail, password: testUserPassword))
          .called(1);

      expect(signInResult, expectedResult);
    });

    test('Should call firebase auth create user with expected data', () async {
      final expectedResult = await Future.value(mockUserCredential);

      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => expectedResult);

      final createAccountResult = await firebaseAuthServiceSUT.createAcccount();
      verify(await mockFirebaseAuth.createUserWithEmailAndPassword(
              email: testUserEmail, password: testUserPassword))
          .called(1);

      expect(createAccountResult, expectedResult);
    });*/
  });
}
