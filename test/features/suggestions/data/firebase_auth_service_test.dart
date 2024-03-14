import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

/*
@GenerateMocks([FirebaseAuth, UserCredential])
void main() {
  const testUserEmail = 'user@email.com';
  const testUserPassword = 'user123';

  late MockitoFirebaseAuth mockFirebaseAuth;
  late FirebaseAuthService firebaseAuthServiceSUT;
  late MockUserCredential mockUserCredential;

  group('Firebase auth service tests', () {
    setUp(() {
      mockFirebaseAuth = MockitoFirebaseAuth();

      firebaseAuthServiceSUT = FirebaseAuthService(mockFirebaseAuth);
      mockUserCredential = MockUserCredential();

      firebaseAuthServiceSUT.email = testUserEmail;
      firebaseAuthServiceSUT.password = testUserPassword;
    });

    test('Should call firebase auth sign in with expected data', () async {
      final expectedResult = await Future.value(mockUserCredential);
      when(mockFirebaseAuth.signInWithEmailAndPassword(
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
    });
  });
}
*/