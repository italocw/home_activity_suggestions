import 'package:home_activity_sugestions/features/suggestions/domain/entities/category.dart';
import 'package:equatable/equatable.dart';

class Suggestion extends Equatable {
  final String? id;
  final String title;
  final String description;
  final Category category;

  const Suggestion({required this.id, required this.title, required this.description, required this.category});

  @override
  List<Object> get props => [id ?? "", title, description, category];

  @override
  bool get stringify => true;
}
