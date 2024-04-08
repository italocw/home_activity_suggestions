import 'package:flutter/material.dart';

class CategoryName extends StatelessWidget {
  const CategoryName({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }
}
