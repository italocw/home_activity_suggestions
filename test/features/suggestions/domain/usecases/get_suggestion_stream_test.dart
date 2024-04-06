import 'package:flutter_test/flutter_test.dart';
import 'package:home_activity_suggestions/core/data/result.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/get_suggestion_stream.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_suggestion_stream_test.mocks.dart';

@GenerateMocks([SuggestionRepository, Stream])
void main() {
  final MockSuggestionRepository mockSuggestionRepository =
      MockSuggestionRepository();
  final MockStream<List<Suggestion>> mockStream = MockStream();
  late GetSuggestionStream getSuggestionStream;

  group('GetSuggestionStream usecase tests', () {
    test('Should return suggestion list stream', (() {
      getSuggestionStream =
          GetSuggestionStream(suggestionRepository: mockSuggestionRepository);

      when(mockSuggestionRepository.getSuggestionsStream())
          .thenAnswer((_)=>mockStream);
      final result = getSuggestionStream();

      expect(result, mockStream);
    }));
  });
}
