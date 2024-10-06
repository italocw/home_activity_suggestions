import 'package:flutter/material.dart';

class SuggestionTitle extends StatelessWidget {
  const SuggestionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
    );
  }
}
