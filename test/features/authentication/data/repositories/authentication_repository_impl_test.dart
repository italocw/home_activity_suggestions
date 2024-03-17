import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_sugestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_sugestions/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:home_activity_sugestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_sugestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_repository_impl_test.mocks.dart';


@GenerateMocks([AuthenticationDataSource, UserCredential, User])
void main() {
 late MockAuthenticationDataSource mockAuthenticationDataSource;
  const testEmail = "email@email.com";
  const testPassword = "password";
  late AuthenticationRepository authenticationRepository;
const testDomainUser = DomainUser(id: "id", email: "email@email.com");
  setUp(() {
    mockAuthenticationDataSource = MockAuthenticationDataSource();
    authenticationRepository = AuthenticationRepositoryImpl(authenticationDataSource:mockAuthenticationDataSource );
  });

}
