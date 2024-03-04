// Mocks generated by Mockito 5.4.4 from annotations
// in home_activity_sugestions/test/features/suggestions/data/repositories/suggestion_repository_implementation_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_remote_datasource.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

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

class _FakeDocumentSnapshot_0<T extends Object?> extends _i1.SmartFake
    implements _i2.DocumentSnapshot<T> {
  _FakeDocumentSnapshot_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDocumentReference_1<T1 extends Object?> extends _i1.SmartFake
    implements _i2.DocumentReference<T1> {
  _FakeDocumentReference_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSnapshotMetadata_2 extends _i1.SmartFake
    implements _i2.SnapshotMetadata {
  _FakeSnapshotMetadata_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SuggestionRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSuggestionDataSource extends _i1.Mock
    implements _i3.SuggestionDataSource {
  MockSuggestionDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i2.QuerySnapshot<Object?>> get snapshots => (super.noSuchMethod(
        Invocation.getter(#snapshots),
        returnValue: _i4.Stream<_i2.QuerySnapshot<Object?>>.empty(),
      ) as _i4.Stream<_i2.QuerySnapshot<Object?>>);

  @override
  _i4.Future<List<_i2.DocumentSnapshot<Object?>>> getAllSuggestionDocuments() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i4.Future<List<_i2.DocumentSnapshot<Object?>>>.value(
            <_i2.DocumentSnapshot<Object?>>[]),
      ) as _i4.Future<List<_i2.DocumentSnapshot<Object?>>>);

  @override
  _i4.Future<void> add(Map<String, dynamic>? suggestion) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [suggestion],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.DocumentSnapshot<Object?>> getById(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getById,
          [id],
        ),
        returnValue: _i4.Future<_i2.DocumentSnapshot<Object?>>.value(
            _FakeDocumentSnapshot_0<Object?>(
          this,
          Invocation.method(
            #getById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.DocumentSnapshot<Object?>>);

  @override
  _i4.Future<void> update(
    String? documentId,
    Map<String, dynamic>? updatedData,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #update,
          [
            documentId,
            updatedData,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> delete(String? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [DocumentSnapshot].
///
/// See the documentation for Mockito's code generation for more information.
class MockDocumentSnapshot<T extends Object?> extends _i1.Mock
    implements _i2.DocumentSnapshot<T> {
  MockDocumentSnapshot() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#id),
        ),
      ) as String);

  @override
  _i2.DocumentReference<T> get reference => (super.noSuchMethod(
        Invocation.getter(#reference),
        returnValue: _FakeDocumentReference_1<T>(
          this,
          Invocation.getter(#reference),
        ),
      ) as _i2.DocumentReference<T>);

  @override
  _i2.SnapshotMetadata get metadata => (super.noSuchMethod(
        Invocation.getter(#metadata),
        returnValue: _FakeSnapshotMetadata_2(
          this,
          Invocation.getter(#metadata),
        ),
      ) as _i2.SnapshotMetadata);

  @override
  bool get exists => (super.noSuchMethod(
        Invocation.getter(#exists),
        returnValue: false,
      ) as bool);

  @override
  dynamic get(Object? field) => super.noSuchMethod(Invocation.method(
        #get,
        [field],
      ));

  @override
  dynamic operator [](Object? field) => super.noSuchMethod(Invocation.method(
        #[],
        [field],
      ));
}
