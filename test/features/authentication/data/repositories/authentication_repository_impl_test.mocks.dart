// Mocks generated by Mockito 5.4.4 from annotations
// in home_activity_suggestions/test/features/authentication/data/repositories/authentication_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:home_activity_suggestions/features/authentication/data/datasource/authentication_datasource.dart'
    as _i3;
import 'package:home_activity_suggestions/features/authentication/domain/domain_user_converter.dart'
    as _i7;
import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserCredential_0 extends _i1.SmartFake
    implements _i2.UserCredential {
  _FakeUserCredential_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserMetadata_1 extends _i1.SmartFake implements _i2.UserMetadata {
  _FakeUserMetadata_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMultiFactor_2 extends _i1.SmartFake implements _i2.MultiFactor {
  _FakeMultiFactor_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIdTokenResult_3 extends _i1.SmartFake implements _i2.IdTokenResult {
  _FakeIdTokenResult_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeConfirmationResult_4 extends _i1.SmartFake
    implements _i2.ConfirmationResult {
  _FakeConfirmationResult_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_5 extends _i1.SmartFake implements _i2.User {
  _FakeUser_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthenticationDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationDataSource extends _i1.Mock
    implements _i3.AuthenticationDataSource {
  MockAuthenticationDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserCredential> createAccount({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createAccount,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i4.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #createAccount,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i4.Future<_i2.UserCredential>);

  @override
  _i4.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.UserCredential> signIn({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i4.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #signIn,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i4.Future<_i2.UserCredential>);

  @override
  _i4.Stream<_i2.User?> getUserStream() => (super.noSuchMethod(
        Invocation.method(
          #getUserStream,
          [],
        ),
        returnValue: _i4.Stream<_i2.User?>.empty(),
      ) as _i4.Stream<_i2.User?>);
}

/// A class which mocks [DomainUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockDomainUser extends _i1.Mock implements _i5.DomainUser {
  MockDomainUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#id),
        ),
      ) as String);

  @override
  String get email => (super.noSuchMethod(
        Invocation.getter(#email),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#email),
        ),
      ) as String);

  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);
}

/// A class which mocks [UserCredential].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserCredential extends _i1.Mock implements _i2.UserCredential {
  MockUserCredential() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [DomainUserConverter].
///
/// See the documentation for Mockito's code generation for more information.
class MockDomainUserConverter extends _i1.Mock
    implements _i7.DomainUserConverter {
  MockDomainUserConverter() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i2.User {
  MockUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get emailVerified => (super.noSuchMethod(
        Invocation.getter(#emailVerified),
        returnValue: false,
      ) as bool);

  @override
  bool get isAnonymous => (super.noSuchMethod(
        Invocation.getter(#isAnonymous),
        returnValue: false,
      ) as bool);

  @override
  _i2.UserMetadata get metadata => (super.noSuchMethod(
        Invocation.getter(#metadata),
        returnValue: _FakeUserMetadata_1(
          this,
          Invocation.getter(#metadata),
        ),
      ) as _i2.UserMetadata);

  @override
  List<_i2.UserInfo> get providerData => (super.noSuchMethod(
        Invocation.getter(#providerData),
        returnValue: <_i2.UserInfo>[],
      ) as List<_i2.UserInfo>);

  @override
  String get uid => (super.noSuchMethod(
        Invocation.getter(#uid),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#uid),
        ),
      ) as String);

  @override
  _i2.MultiFactor get multiFactor => (super.noSuchMethod(
        Invocation.getter(#multiFactor),
        returnValue: _FakeMultiFactor_2(
          this,
          Invocation.getter(#multiFactor),
        ),
      ) as _i2.MultiFactor);

  @override
  _i4.Future<void> delete() => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<String?> getIdToken([bool? forceRefresh = false]) =>
      (super.noSuchMethod(
        Invocation.method(
          #getIdToken,
          [forceRefresh],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);

  @override
  _i4.Future<_i2.IdTokenResult> getIdTokenResult(
          [bool? forceRefresh = false]) =>
      (super.noSuchMethod(
        Invocation.method(
          #getIdTokenResult,
          [forceRefresh],
        ),
        returnValue: _i4.Future<_i2.IdTokenResult>.value(_FakeIdTokenResult_3(
          this,
          Invocation.method(
            #getIdTokenResult,
            [forceRefresh],
          ),
        )),
      ) as _i4.Future<_i2.IdTokenResult>);

  @override
  _i4.Future<_i2.UserCredential> linkWithCredential(
          _i2.AuthCredential? credential) =>
      (super.noSuchMethod(
        Invocation.method(
          #linkWithCredential,
          [credential],
        ),
        returnValue: _i4.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #linkWithCredential,
            [credential],
          ),
        )),
      ) as _i4.Future<_i2.UserCredential>);

  @override
  _i4.Future<_i2.UserCredential> linkWithProvider(_i2.AuthProvider? provider) =>
      (super.noSuchMethod(
        Invocation.method(
          #linkWithProvider,
          [provider],
        ),
        returnValue: _i4.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #linkWithProvider,
            [provider],
          ),
        )),
      ) as _i4.Future<_i2.UserCredential>);

  @override
  _i4.Future<_i2.UserCredential> reauthenticateWithProvider(
          _i2.AuthProvider? provider) =>
      (super.noSuchMethod(
        Invocation.method(
          #reauthenticateWithProvider,
          [provider],
        ),
        returnValue: _i4.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #reauthenticateWithProvider,
            [provider],
          ),
        )),
      ) as _i4.Future<_i2.UserCredential>);

  @override
  _i4.Future<_i2.UserCredential> reauthenticateWithPopup(
          _i2.AuthProvider? provider) =>
      (super.noSuchMethod(
        Invocation.method(
          #reauthenticateWithPopup,
          [provider],
        ),
        returnValue: _i4.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #reauthenticateWithPopup,
            [provider],
          ),
        )),
      ) as _i4.Future<_i2.UserCredential>);

  @override
  _i4.Future<void> reauthenticateWithRedirect(_i2.AuthProvider? provider) =>
      (super.noSuchMethod(
        Invocation.method(
          #reauthenticateWithRedirect,
          [provider],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.UserCredential> linkWithPopup(_i2.AuthProvider? provider) =>
      (super.noSuchMethod(
        Invocation.method(
          #linkWithPopup,
          [provider],
        ),
        returnValue: _i4.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #linkWithPopup,
            [provider],
          ),
        )),
      ) as _i4.Future<_i2.UserCredential>);

  @override
  _i4.Future<void> linkWithRedirect(_i2.AuthProvider? provider) =>
      (super.noSuchMethod(
        Invocation.method(
          #linkWithRedirect,
          [provider],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.ConfirmationResult> linkWithPhoneNumber(
    String? phoneNumber, [
    _i2.RecaptchaVerifier? verifier,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #linkWithPhoneNumber,
          [
            phoneNumber,
            verifier,
          ],
        ),
        returnValue:
            _i4.Future<_i2.ConfirmationResult>.value(_FakeConfirmationResult_4(
          this,
          Invocation.method(
            #linkWithPhoneNumber,
            [
              phoneNumber,
              verifier,
            ],
          ),
        )),
      ) as _i4.Future<_i2.ConfirmationResult>);

  @override
  _i4.Future<_i2.UserCredential> reauthenticateWithCredential(
          _i2.AuthCredential? credential) =>
      (super.noSuchMethod(
        Invocation.method(
          #reauthenticateWithCredential,
          [credential],
        ),
        returnValue: _i4.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #reauthenticateWithCredential,
            [credential],
          ),
        )),
      ) as _i4.Future<_i2.UserCredential>);

  @override
  _i4.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> sendEmailVerification(
          [_i2.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendEmailVerification,
          [actionCodeSettings],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.User> unlink(String? providerId) => (super.noSuchMethod(
        Invocation.method(
          #unlink,
          [providerId],
        ),
        returnValue: _i4.Future<_i2.User>.value(_FakeUser_5(
          this,
          Invocation.method(
            #unlink,
            [providerId],
          ),
        )),
      ) as _i4.Future<_i2.User>);

  @override
  _i4.Future<void> updateEmail(String? newEmail) => (super.noSuchMethod(
        Invocation.method(
          #updateEmail,
          [newEmail],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updatePassword(String? newPassword) => (super.noSuchMethod(
        Invocation.method(
          #updatePassword,
          [newPassword],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updatePhoneNumber(
          _i2.PhoneAuthCredential? phoneCredential) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePhoneNumber,
          [phoneCredential],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updateDisplayName(String? displayName) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateDisplayName,
          [displayName],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updatePhotoURL(String? photoURL) => (super.noSuchMethod(
        Invocation.method(
          #updatePhotoURL,
          [photoURL],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updateProfile({
    String? displayName,
    String? photoURL,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProfile,
          [],
          {
            #displayName: displayName,
            #photoURL: photoURL,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> verifyBeforeUpdateEmail(
    String? newEmail, [
    _i2.ActionCodeSettings? actionCodeSettings,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyBeforeUpdateEmail,
          [
            newEmail,
            actionCodeSettings,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
