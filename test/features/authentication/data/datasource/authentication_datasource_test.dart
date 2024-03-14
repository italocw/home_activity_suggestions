import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_sugestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart'
    as FakeFirebaseAuth; // Uses a fake implementation of firebase auth for test goals. This is not a mockito mock
import 'authentication_datasource_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserCredential])
void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late AuthenticationDataSource authenticationDataSource;
  late FakeFirebaseAuth.MockFirebaseAuth fakeFirebaseAuth;
  final testEmail = "email@email.com";
  final testPassword = "password";

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    fakeFirebaseAuth = FakeFirebaseAuth.MockFirebaseAuth();
  });

  group('Authentication data source tests', () {
    test('Should  successfully sign in with given email and password',
        (() async {
      authenticationDataSource =
          AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);
      final expectedUserCredential = await Future.value(mockUserCredential);
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => expectedUserCredential);

      final userCredential =
          await authenticationDataSource.signIn(testEmail, testPassword);

      verify(await mockFirebaseAuth.signInWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .called(1);

      expect(userCredential, expectedUserCredential);
    }));

    test('Should successfully create user with given email and password',
        (() async {
      authenticationDataSource =
          AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);
      final expectedUserCredential = await Future.value(mockUserCredential);
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => expectedUserCredential);

      final userCredential =
          await authenticationDataSource.createAccount(testEmail, testPassword);

      verify(await mockFirebaseAuth.createUserWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .called(1);

      expect(userCredential, expectedUserCredential);
    }));

    test('Should call firebase auth signOut method', (() async {
      authenticationDataSource =
          AuthenticationDataSource(firebaseAuth: mockFirebaseAuth);

      when(mockFirebaseAuth.signOut()).thenAnswer((_) async => {});

      await authenticationDataSource.logout();

      verify(await mockFirebaseAuth.signOut()).called(1);
    }));

    test('Should notify user sign in when entering with email and password',
        (() async {
      authenticationDataSource =
          AuthenticationDataSource(firebaseAuth: fakeFirebaseAuth);

      final Stream<User?> userStream = authenticationDataSource.userStream;

      await fakeFirebaseAuth.signInWithEmailAndPassword(
          email: testEmail, password: testPassword);

      userStream.listen((user) {
        expect(user, isNotNull);
        expect(user!.email, testEmail);
      });
    }));
  });
}
