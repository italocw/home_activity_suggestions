import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_suggestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_suggestions/features/authentication/data/firebase_auth_error_codes.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'authentication_datasource_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserCredential, User])
void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late AuthenticationDataSource authenticationDataSource;
  const testEmail = "email@email.com";
  const testPassword = "password";

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockUser  =MockUser();
  });

  group('Authentication data source tests', () {
    test('Signing in with the provided email and password should succeed',
        (() async {
      authenticationDataSource =
          AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);
      final expectedUserCredential = await Future.value(mockUserCredential);
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => expectedUserCredential);

      final userCredential = await authenticationDataSource.signIn(
          email: testEmail, password: testPassword);

      verify(await mockFirebaseAuth.signInWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .called(1);

      expect(userCredential, expectedUserCredential);
    }));

    test('Should return expected not null current user',
        (()  {
          when(mockFirebaseAuth.currentUser)
              .thenReturn(mockUser);

          authenticationDataSource =
              AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);

          final resultUser = authenticationDataSource.currentUser;
           expect(resultUser, mockUser);
        }));

    test('Should return null when try to get current user',
        (()  {
          when(mockFirebaseAuth.currentUser)
              .thenReturn(null);

          authenticationDataSource =
              AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);

          final resultUser = authenticationDataSource.currentUser;
          expect(resultUser, null);
        }));


    test(
        'Attempting to sign in with the provided email and password should throw a FirebaseAuthException',
        (() async {
      authenticationDataSource =
          AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);
      final expectedException = FirebaseAuthException(
          code: SignInWithEmailAndPasswordErrorCodes.userNotFound);
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => throw expectedException);

      try {
        await authenticationDataSource.signIn(
            email: testEmail, password: testPassword);

            } catch (exception) {
        expect(exception, expectedException);
      }
    }));

    test('Create account with the provided email and password should succeed.',
        (() async {
      authenticationDataSource =
          AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);
      final expectedUserCredential =mockUserCredential;
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => expectedUserCredential);

      final userCredential = await authenticationDataSource.createAccount(
          email: testEmail, password: testPassword);

      verify(await mockFirebaseAuth.createUserWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .called(1);

      expect(userCredential, expectedUserCredential);
    }));

    test(
        'Attempting to create account in the provided email and password should throw a FirebaseAuthException',
        (() async {
          authenticationDataSource =
              AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);
          final expectedException = FirebaseAuthException(
              code: CreateUserWithEmailAndPasswordErrorCodes.emailAlreadyInUse);
          when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: testEmail, password: testPassword))
              .thenAnswer((_) async => throw expectedException);

          try {
            await authenticationDataSource.createAccount(
                email: testEmail, password: testPassword);

          } catch (exception) {
            expect(exception, expectedException);
          }
        }));

    test('Should call firebase auth signOut method', (() async {
      authenticationDataSource =
          AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);

      when(mockFirebaseAuth.signOut()).thenAnswer((_) async => {});
      await authenticationDataSource.logout();

      verify(await mockFirebaseAuth.signOut()).called(1);
    }));
  });
}
