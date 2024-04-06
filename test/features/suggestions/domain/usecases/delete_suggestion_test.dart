import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/delete_suggestion.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_suggestion_test.mocks.dart';

@GenerateMocks([SuggestionRepository])
void main() {
  final MockSuggestionRepository mockSuggestionRepository =
  MockSuggestionRepository();
  const String suggestionId = 'id';
  late DeleteSuggestion deleteSuggestion;

  group('DeleteSuggestion usecase tests', () {
    test('Should call repository delete suggestion method', (() async {
      deleteSuggestion =
          DeleteSuggestion(suggestionRepository: mockSuggestionRepository);

      await deleteSuggestion(suggestionId);

      verify(await mockSuggestionRepository.deleteSuggestion(suggestionId))
          .called(1);
    }));
  });
}
