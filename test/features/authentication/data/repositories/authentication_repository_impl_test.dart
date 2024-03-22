import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/core/result.dart';
import 'package:home_activity_suggestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_suggestions/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:home_activity_suggestions/features/authentication/domain/domain_user_converter.dart';
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_repository_impl_test.mocks.dart';

@GenerateMocks([
  AuthenticationDataSource,
  DomainUser,
  UserCredential,
  DomainUserConverter,
  User
])
void main() {
  late MockAuthenticationDataSource mockAuthenticationDataSource;
  const testEmail = "email@email.com";
  const testPassword = "password";
  late AuthenticationRepository authenticationRepository;
  late MockDomainUser mockDomainUser;
  late MockUserCredential mockUserCredential;
  late MockDomainUserConverter mockDomainUserConverter;
  late MockUser mockUser;

  setUp(() {
    mockAuthenticationDataSource = MockAuthenticationDataSource();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockDomainUser = MockDomainUser();
    mockDomainUserConverter = MockDomainUserConverter();
  });

  group('Authentication repository implementation tests', () {
    test('Signing in with the provided email and password should succeed',
        (() async {
      when(mockDomainUserConverter.fromUserCredential(
              userCredential: mockUserCredential))
          .thenReturn(mockDomainUser);

      authenticationRepository = AuthenticationRepositoryImpl(
          authenticationDataSource: mockAuthenticationDataSource,
          domainUserConverter: mockDomainUserConverter);

      final Success<DomainUser> expectedResult = Success(mockDomainUser);

      when(mockAuthenticationDataSource.signIn(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => mockUserCredential);

      final userResult = await authenticationRepository.signIn(
          email: testEmail, password: testPassword);

      expect(userResult, expectedResult);
    }));
  });
  test('Should get expected non null current Domain User', (() async {
    when(mockDomainUserConverter.fromFirebaseUser(firebaseUser: mockUser))
        .thenReturn(mockDomainUser);

    when(mockAuthenticationDataSource.currentUser).thenReturn(mockUser);

    authenticationRepository = AuthenticationRepositoryImpl(
        authenticationDataSource: mockAuthenticationDataSource,
        domainUserConverter: mockDomainUserConverter);

    final userResult =  authenticationRepository.currentDomainUser;

    expect(userResult, mockDomainUser);
  }));

  test('Should get null current Domain User', (() async {
    when(mockDomainUserConverter.fromFirebaseUser(firebaseUser: mockUser))
        .thenReturn(null);

    when(mockAuthenticationDataSource.currentUser).thenReturn(mockUser);

    authenticationRepository = AuthenticationRepositoryImpl(
        authenticationDataSource: mockAuthenticationDataSource,
        domainUserConverter: mockDomainUserConverter);

    final userResult =  authenticationRepository.currentDomainUser;

    expect(userResult, null);
  }));

  test('Create account with the provided email and password should succeed',
      (() async {
    when(mockDomainUserConverter.fromUserCredential(
            userCredential: mockUserCredential))
        .thenReturn(mockDomainUser);

    authenticationRepository = AuthenticationRepositoryImpl(
        authenticationDataSource: mockAuthenticationDataSource,
        domainUserConverter: mockDomainUserConverter);

    final Success<DomainUser> expectedResult = Success(mockDomainUser);

    when(mockAuthenticationDataSource.createAccount(
            email: testEmail, password: testPassword))
        .thenAnswer((_) async => mockUserCredential);

    final userResult = await authenticationRepository.createAccount(
        email: testEmail, password: testPassword);

    expect(userResult, expectedResult);
  }));
}
