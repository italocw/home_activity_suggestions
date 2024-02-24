import 'package:flutter/foundation.dart';

class Suggestion {
  final String id;
  String title;
  String description;
  Category category;

  Suggestion(
      {required this.id,
      required this.title,
      required this.description,
      required this.category});
}
