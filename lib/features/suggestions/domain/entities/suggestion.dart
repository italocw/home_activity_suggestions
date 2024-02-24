import 'package:home_activity_sugestions/features/suggestions/domain/entities/category.dart';
import 'package:equatable/equatable.dart';

class Suggestion extends Equatable {
  final String id;
  String title;
  String description;
  Category category;

  Suggestion(
      {required this.id,
      required this.title,
      required this.description,
      required this.category});

  @override
  List<Object> get props => [id, title, description, category];

  @override
  bool get stringify => true;
}
