import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_suggestion_test.mocks.dart';

@GenerateMocks([SuggestionRepository, Suggestion, Success, Failure])
void main() {
  final MockSuggestionRepository mockSuggestionRepository =
      MockSuggestionRepository();

  final MockSuccess<Suggestion> mockSuccess = MockSuccess();
  final MockFailure<Suggestion> mockFailure = MockFailure();
  const String suggestionId = 'id';
  final MockSuggestion mockSuggestion = MockSuggestion();
  late GetSuggestion getSuggestion;

  group('GetSuggestion usecase tests', () {
    setUpAll(() {
      provideDummy<Suggestion>(mockSuggestion);

      when(mockSuccess.value).thenReturn(mockSuggestion);
      when(mockFailure.exception).thenReturn(Exception());

      provideDummy<Result<Suggestion>>(mockSuccess);
    });

    test(
        'Should return expected successful result after calling the get suggestion repository method',
        (() async {
      getSuggestion =
          GetSuggestion(suggestionRepository: mockSuggestionRepository);

      when(mockSuggestionRepository.getSuggestionById(suggestionId))
          .thenAnswer((_) async => mockSuccess);
      final result = await getSuggestion(suggestionId);

      expect(result, mockSuccess);
    }));

    test(
        'Should return expected failure result after calling the get suggestion repository method',
        (() async {
          getSuggestion =
              GetSuggestion(suggestionRepository: mockSuggestionRepository);

          when(mockSuggestionRepository.getSuggestionById(suggestionId))
              .thenAnswer((_) async => mockFailure);
          final result = await getSuggestion(suggestionId);

          expect(result, mockFailure);
        }));
  });
}
