import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({required this.text, required this.onPressed, super.key});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
