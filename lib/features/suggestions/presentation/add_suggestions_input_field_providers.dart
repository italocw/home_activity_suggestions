import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<String> addSuggestionTitleProvider =
    StateProvider((ref) => "");
final StateProvider<String> addSuggestionDescriptionProvider =
    StateProvider((ref) => "");
