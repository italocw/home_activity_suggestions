import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/update_suggestion.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_suggestion_test.mocks.dart';

@GenerateMocks([SuggestionRepository, Suggestion])
void main() {
  final MockSuggestionRepository mockSuggestionRepository =
  MockSuggestionRepository();
  final MockSuggestion mockSuggestion = MockSuggestion();
  late UpdateSuggestion updateSuggestion;

  group('UpdateSuggestion usecase tests', () {
    test('Should call repository update suggestion method', (() async {
      updateSuggestion =
          UpdateSuggestion(suggestionRepository: mockSuggestionRepository);

      await updateSuggestion(mockSuggestion);

      verify(await mockSuggestionRepository.updateSuggestion(mockSuggestion))
          .called(1);
    }));
  });
}
