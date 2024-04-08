// Mocks generated by Mockito 5.4.4 from annotations
// in home_activity_suggestions/test/features/suggestions/domain/usecases/delete_suggestion_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:home_activity_suggestions/core/data/result.dart' as _i5;
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart'
    as _i4;
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart'
    as _i2;
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

/// A class which mocks [SuggestionRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSuggestionRepository extends _i1.Mock
    implements _i2.SuggestionRepository {
  MockSuggestionRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i4.Suggestion>> getSuggestionsStream() =>
      (super.noSuchMethod(
        Invocation.method(
          #getSuggestionsStream,
          [],
        ),
        returnValue: _i3.Stream<List<_i4.Suggestion>>.empty(),
      ) as _i3.Stream<List<_i4.Suggestion>>);

  @override
  _i3.Future<void> addSuggestion(_i4.Suggestion? suggestion) =>
      (super.noSuchMethod(
        Invocation.method(
          #addSuggestion,
          [suggestion],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> updateSuggestion(_i4.Suggestion? suggestion) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateSuggestion,
          [suggestion],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> deleteSuggestion(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteSuggestion,
          [id],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<_i5.Result<_i4.Suggestion>> getSuggestionById(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSuggestionById,
          [id],
        ),
        returnValue: _i3.Future<_i5.Result<_i4.Suggestion>>.value(
            _i6.dummyValue<_i5.Result<_i4.Suggestion>>(
          this,
          Invocation.method(
            #getSuggestionById,
            [id],
          ),
        )),
      ) as _i3.Future<_i5.Result<_i4.Suggestion>>);
}