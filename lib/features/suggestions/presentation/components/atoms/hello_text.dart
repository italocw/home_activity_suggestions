import 'package:flutter/material.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Olá!\nInforme sua conta ou cadastre-se!",
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }
}
