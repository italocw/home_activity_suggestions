import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/add_suggestion.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_suggestion_test.mocks.dart';

@GenerateMocks([SuggestionRepository, Suggestion])
void main() {
  final MockSuggestionRepository mockSuggestionRepository =
      MockSuggestionRepository();
  final MockSuggestion mockSuggestion = MockSuggestion();
  late AddSuggestion addSuggestion;

  group('AddSuggestion usecase tests', () {
    test('Should call repository add suggestion method', (() async {
      addSuggestion =
          AddSuggestion(suggestionRepository: mockSuggestionRepository);

      await addSuggestion(mockSuggestion);

      verify(await mockSuggestionRepository.addSuggestion(mockSuggestion))
          .called(1);
    }));
  });
}
