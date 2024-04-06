import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/features/authentication/domain/domain_user_converter.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'domain_user_converter_test.mocks.dart';


@GenerateMocks([UserCredential, User])
void main() {
  const testEmail = "email@email.com";
  const testId = "id";
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late DomainUserConverter testDomainUserConverter;

  setUp(() {
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    testDomainUserConverter= DomainUserConverter();
  });

  group('Domain User Converter tests', () {
    test('Should return expected non null domain user from Firebase User', (()  {
      when(mockUser.email).thenReturn(testEmail);
      when(mockUser.uid).thenReturn(testId);

      const expectedDomainUser = DomainUser(id: testId, email: testEmail);
      final result = testDomainUserConverter.fromFirebaseUser(firebaseUser: mockUser);
      expect(result, expectedDomainUser);
    }));

    test('Should return expected non null domain user from Firebase User Credential',
        (()  {
      when(mockUser.email).thenReturn(testEmail);
      when(mockUser.uid).thenReturn(testId);
      when(mockUserCredential.user).thenReturn(mockUser);

      const expectedDomainUser = DomainUser(id: testId, email: testEmail);
      final result =testDomainUserConverter.fromUserCredential(userCredential: mockUserCredential);
      expect(result, expectedDomainUser);
    }));

    test('Should return null domain user from Firebase User', (()  {
      final result = testDomainUserConverter.fromFirebaseUser(firebaseUser: null);
      expect(result, null);
    }));

    test('Should return null domain user from Firebase User Credential',
        (()  {
          final result =testDomainUserConverter.fromUserCredential(userCredential: null);
          expect(result, null);
        }));
  });
}
