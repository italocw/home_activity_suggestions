import 'package:flutter/material.dart';

class SuggestionDescription extends StatelessWidget {
  const SuggestionDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(fontSize: 18),
    );
  }
}
