// Mocks generated by Mockito 5.4.4 from annotations
// in home_activity_suggestions/test/features/suggestions/domain/usecases/update_suggestion_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:home_activity_suggestions/core/data/result.dart' as _i6;
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart'
    as _i5;
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart'
    as _i2;
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

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

class _FakeSuggestionCategory_0 extends _i1.SmartFake
    implements _i2.SuggestionCategory {
  _FakeSuggestionCategory_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SuggestionRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSuggestionRepository extends _i1.Mock
    implements _i3.SuggestionRepository {
  MockSuggestionRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<List<_i5.Suggestion>> getSuggestionsStream() =>
      (super.noSuchMethod(
        Invocation.method(
          #getSuggestionsStream,
          [],
        ),
        returnValue: _i4.Stream<List<_i5.Suggestion>>.empty(),
      ) as _i4.Stream<List<_i5.Suggestion>>);

  @override
  _i4.Future<void> addSuggestion(_i5.Suggestion? suggestion) =>
      (super.noSuchMethod(
        Invocation.method(
          #addSuggestion,
          [suggestion],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updateSuggestion(_i5.Suggestion? suggestion) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateSuggestion,
          [suggestion],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteSuggestion(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteSuggestion,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i6.Result<_i5.Suggestion>> getSuggestionById(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSuggestionById,
          [id],
        ),
        returnValue: _i4.Future<_i6.Result<_i5.Suggestion>>.value(
            _i7.dummyValue<_i6.Result<_i5.Suggestion>>(
          this,
          Invocation.method(
            #getSuggestionById,
            [id],
          ),
        )),
      ) as _i4.Future<_i6.Result<_i5.Suggestion>>);
}

/// A class which mocks [Suggestion].
///
/// See the documentation for Mockito's code generation for more information.
class MockSuggestion extends _i1.Mock implements _i5.Suggestion {
  MockSuggestion() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get title => (super.noSuchMethod(
        Invocation.getter(#title),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#title),
        ),
      ) as String);

  @override
  String get description => (super.noSuchMethod(
        Invocation.getter(#description),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#description),
        ),
      ) as String);

  @override
  _i2.SuggestionCategory get category => (super.noSuchMethod(
        Invocation.getter(#category),
        returnValue: _FakeSuggestionCategory_0(
          this,
          Invocation.getter(#category),
        ),
      ) as _i2.SuggestionCategory);

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);

  @override
  bool get stringify => (super.noSuchMethod(
        Invocation.getter(#stringify),
        returnValue: false,
      ) as bool);
}