import 'package:flutter/material.dart';

class AuthText extends StatelessWidget {
  const AuthText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }
}
