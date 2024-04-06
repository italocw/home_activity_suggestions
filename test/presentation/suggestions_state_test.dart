import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion_stream.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/update_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/suggestions_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'suggestions_state_test.mocks.dart';

@GenerateMocks([
  AddSuggestion,
  GetSuggestion,
  DeleteSuggestion,
  GetSuggestionStream,
  UpdateSuggestion,
  Suggestion,
  Success,
  Failure
])
void main() {
  final MockAddSuggestion mockAddSuggestion = MockAddSuggestion();
  late MockGetSuggestion mockGetSuggestion = MockGetSuggestion();

  final MockSuccess<Suggestion> mockSuccess = MockSuccess();
  final MockFailure<Suggestion> mockFailure = MockFailure();
  final MockDeleteSuggestion mockDeleteSuggestion = MockDeleteSuggestion();
  final MockUpdateSuggestion mockUpdateSuggestion = MockUpdateSuggestion();
  final MockGetSuggestionStream mockGetSuggestionStream =
      MockGetSuggestionStream();
  final MockSuggestion mockSuggestion = MockSuggestion();
  const String suggestionId = "id";
  late  SuggestionListNotifier suggestionListNotifier;

  SuggestionListNotifier initializeSuggestionListNotifier() {

    suggestionListNotifier = SuggestionListNotifier(
        addSuggestion: mockAddSuggestion,
        getSuggestion: mockGetSuggestion,
        updateSuggestion: mockUpdateSuggestion,
        deleteSuggestion: mockDeleteSuggestion,
        getSuggestionStream: mockGetSuggestionStream);
    return suggestionListNotifier;
  }

  group('SuggestionListNotifier tests', () {
    setUpAll(() {
      provideDummy<Suggestion>(mockSuggestion);

      when(mockSuccess.value).thenReturn(mockSuggestion);
      when(mockFailure.exception).thenReturn(Exception());

      provideDummy<Result<Suggestion>>(mockSuccess);
    });

    test('Should call add suggestion usecase', (() async {
      suggestionListNotifier = initializeSuggestionListNotifier();
      await suggestionListNotifier.addSuggestion(mockSuggestion);

      verify(await mockAddSuggestion(mockSuggestion)).called(1);
    }));

    test('Should call delete suggestion usecase', (() async {
      suggestionListNotifier = initializeSuggestionListNotifier();
      await suggestionListNotifier.deleteSuggestion(suggestionId);

      verify(await mockDeleteSuggestion(suggestionId)).called(1);
    }));

    test('Should return successful suggestion result', (() async {
      when(mockGetSuggestion(suggestionId)).thenAnswer((_)async =>mockSuccess);
      suggestionListNotifier = initializeSuggestionListNotifier();

      final result = await suggestionListNotifier.getSuggestion(suggestionId);
      expect(result, mockSuccess);
    }));

    test('Should return fail suggestion result', (() async {
      when(mockGetSuggestion(suggestionId)).thenAnswer((_)async =>mockFailure);
      suggestionListNotifier = initializeSuggestionListNotifier();

      final result = await suggestionListNotifier.getSuggestion(suggestionId);
      expect(result, mockFailure);
    }));
  });
}


